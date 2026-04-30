import 'package:design_system/design_system.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localizations/localizations.dart';
import 'package:presenter/src/presentation/bloc/presenter_bloc.dart';
import 'package:presenter/src/presentation/models/presentation.dart';
import 'package:presenter/src/presentation/models/presenting_state.dart';

typedef PresentationBuilder<P extends Presentation> =
    void Function(BuildContext context, P presentation);

typedef DefaultPresenter<
  B extends StateStreamable<S>,
  S extends PresentingState
> = Presenter<B, S, Presentation>;

/// Prefer [DefaultPresenter] if you don't plan to introduce custom presentation
class Presenter<
  B extends StateStreamable<S>,
  S extends PresentingState,
  P extends Presentation
>
    extends StatelessWidget {
  const Presenter({super.key, required this.child, this.builder});

  final Widget child;
  final PresentationBuilder<P>? builder;

  @override
  Widget build(BuildContext context) {
    final presenter = BlocListener<B, S>(
      listenWhen: _listenWhen,
      listener: _listener,
      child: child,
    );

    return TestFacade(
      child: BlocProvider(
        lazy: false,
        child: presenter,
        create: (context) => diContainer<PresenterBloc>(),
      ),
      testBuilder: (context) => diContainer.isRegistered<PresenterBloc>()
          ? BlocProvider(
              lazy: false,
              child: presenter,
              create: (context) => diContainer<PresenterBloc>(),
            )
          : presenter,
    );
  }

  bool _listenWhen(S previous, S current) =>
      current.presentation != null &&
      previous.presentation != current.presentation;

  void _listener(BuildContext context, S state) {
    if ((state.presentation, builder) case (final P present, final builder?)) {
      builder(context, present);
    }

    // [HINT] you can handle custom app wide presentations/exceptions here, for example:
    switch (state.presentation) {
      // case ToastPresentation(test: final text):
      //   Toast.of(context).show(text);
      // case ExceptionPresentation(exception: final e) when e is TermsNotAcceptedException:
      //   context.read<PresenterBloc>().add(PresenterEvent.openAcceptTerms());
      case ExceptionPresentation():
        Toast.of(context).show(context.commonTranslations.error.smthWentWrong);
      default:
    }
    ;
  }
}
