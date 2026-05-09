import 'package:entrypoint/entrypoint.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters/src/di/di_initializer.dart';
import 'package:rick_and_morty_characters/src/presentation/characters/characters_page.dart';
import 'package:rick_and_morty_characters/src/presentation/localization/localizations_delegate.dart';

class CharactersEntrypoint extends StatelessWidget {
  const CharactersEntrypoint({super.key});

  @override
  Widget build(BuildContext context) => Entrypoint.page(
    page: const CharactersPage(),
    initializer: const RickAndMortyCharactersDIInitializer(),
    localizationsDelegate: CharactersLocalizationsDelegate(),
  );
}
