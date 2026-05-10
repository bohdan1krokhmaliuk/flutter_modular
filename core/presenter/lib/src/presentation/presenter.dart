import 'package:design_system/design_system.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_confetti/flutter_confetti.dart';
import 'package:localizations/localizations.dart';
import 'package:presenter/src/presentation/bloc/presenter_bloc.dart';
import 'package:presenter/src/presentation/models/presentation.dart';
import 'package:presenter/src/presentation/models/presenting_state.dart';

typedef PresentationBuilder<P extends Presentation> =
    bool? Function(BuildContext context, P presentation);

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

  /// if returns [true] exits handling presentaion, otherwise default handler will also handle it
  final PresentationBuilder<P>? builder;

  @override
  Widget build(BuildContext context) {
    final presenter = BlocListener<B, S>(
      listenWhen: _listenWhen,
      listener: _listener,
      child: child,
    );

    return diContainer.isRegistered<PresenterBloc>()
        ? BlocProvider.value(
            value: diContainer<PresenterBloc>(),
            child: presenter,
          )
        : presenter;
  }

  bool _listenWhen(S previous, S current) =>
      current.presentation != null &&
      previous.presentation != current.presentation;

  void _listener(BuildContext context, S state) {
    if ((state.presentation, builder) case (final P present, final builder?)) {
      final shouldExit = builder(context, present);
      if (shouldExit ?? false) {
        return;
      }
    }

    // [HINT] you can handle custom app wide presentations/exceptions here, for example:
    switch (state.presentation) {
      // case ExceptionPresentation(exception: final e) when e is TermsNotAcceptedException:
      //   context.read<PresenterBloc?>()?.add(PresenterEvent.openAcceptTerms());
      case ConfettiPresentation(:final duration):
        // [HINT] This is direct usage of 3rd party package inside Presenter
        // you should avoid it and move most 3rd party implementations into some
        // kind of utility wrapper
        final ticks = duration.inMilliseconds ~/ 16;
        Confetti.launch(
          context,
          options: ConfettiOptions(
            particleCount: 200,
            spread: 60,
            ticks: ticks,
            gravity: .5,
            y: 1.3,
            x: 0.1,
            angle: 70,
            startVelocity: 90,
          ),
        );
        Confetti.launch(
          context,
          options: ConfettiOptions(
            particleCount: 200,
            spread: 60,
            ticks: ticks,
            gravity: .5,
            y: 1.3,
            x: .9,
            angle: 110,
            startVelocity: 90,
          ),
        );
      case ExceptionPresentation():
        Toast.of(context).show(context.commonTranslations.error.smthWentWrong);
      default:
    }
  }
}
