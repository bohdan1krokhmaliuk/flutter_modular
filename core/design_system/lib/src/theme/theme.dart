import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: .fromSeed(
    seedColor: Colors.deepPurple,
    brightness: Brightness.light,
  ),
  brightness: Brightness.light,
);

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: .fromSeed(
    seedColor: Colors.deepPurple,
    brightness: Brightness.dark,
  ),
  brightness: Brightness.dark,
);
