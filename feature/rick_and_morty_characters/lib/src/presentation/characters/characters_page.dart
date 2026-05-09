import 'package:design_system/design_system.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_characters/src/domain/model/character.dart';
import 'package:rick_and_morty_characters/src/presentation/characters/bloc/characters_bloc.dart';
import 'package:rick_and_morty_characters/src/presentation/localization/translations_extension.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(title: context.translations.title),
      body: BlocProvider(
        create: (_) => diContainer<CharactersBloc>(),
        child: BlocBuilder<CharactersBloc, CharactersState>(
          builder: (context, state) {
            final bloc = context.read<CharactersBloc>();
            return state.map(
              loading: (_) => const LoadingView(),
              error: (_) => ErrorView(
                onRetry: () => bloc.add(const CharactersEvent.load()),
              ),
              content: (content) => PaginatedListView(
                padding: dimen.x.xs,
                itemCount: content.characters.length,
                hasNextPage: content.hasNextPage,
                isLoadingNextPage: content.isLoadingNextPage,
                failedToLoadNextPage: content.hasNextPageError,
                onLoadNextPage: () => context.read<CharactersBloc>().add(
                  const CharactersEvent.loadMore(),
                ),
                itemBuilder: (_, i) {
                  final character = content.characters[i];

                  return Card(
                    child: ListTile(
                      title: Text(character.name),
                      subtitle: Text(character.location.name),
                      trailing: Icon(
                        switch (character.gender) {
                          Gender.male => Icons.male,
                          Gender.female => Icons.female,
                          Gender.unknown => Icons.question_mark,
                          Gender.genderless => Icons.transgender,
                        },
                        color: switch (character.gender) {
                          Gender.unknown => Colors.grey,
                          Gender.male => Colors.lightBlue,
                          Gender.female => Colors.pinkAccent,
                          Gender.genderless => Colors.greenAccent,
                        },
                        size: md,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
