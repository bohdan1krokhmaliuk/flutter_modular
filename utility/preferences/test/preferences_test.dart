import 'package:checks/checks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:preferences/src/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late _MockSharedPreferences shared;
  late Preferences prefs;

  setUp(() {
    shared = _MockSharedPreferences();
    prefs = Preferences(shared);
  });

  group('getDouble', () {
    test('delegates to SharedPreferences and returns value', () {
      when(() => shared.getDouble('key')).thenReturn(3.14);

      final result = prefs.getDouble('key');

      check(result).isNotNull().equals(3.14);
      verify(() => shared.getDouble('key')).called(1);
    });

    test('returns null when key is absent', () {
      when(() => shared.getDouble('key')).thenReturn(null);

      check(prefs.getDouble('key')).isNull();
    });
  });

  group('setDouble', () {
    test('delegates to SharedPreferences and returns result', () async {
      when(() => shared.setDouble('key', 3.14)).thenAnswer((_) async => true);

      final result = await prefs.setDouble('key', 3.14);

      check(result).isTrue();
      verify(() => shared.setDouble('key', 3.14)).called(1);
    });
  });

  group('getInt', () {
    test('delegates to SharedPreferences and returns value', () {
      when(() => shared.getInt('key')).thenReturn(42);

      final result = prefs.getInt('key');

      check(result).isNotNull().equals(42);
      verify(() => shared.getInt('key')).called(1);
    });

    test('returns null when key is absent', () {
      when(() => shared.getInt('key')).thenReturn(null);

      check(prefs.getInt('key')).isNull();
    });
  });

  group('setInt', () {
    test('delegates to SharedPreferences and returns result', () async {
      when(() => shared.setInt('key', 42)).thenAnswer((_) async => true);

      final result = await prefs.setInt('key', 42);

      check(result).isTrue();
      verify(() => shared.setInt('key', 42)).called(1);
    });
  });

  group('getString', () {
    test('delegates to SharedPreferences and returns value', () {
      when(() => shared.getString('key')).thenReturn('hello');

      final result = prefs.getString('key');

      check(result).isNotNull().equals('hello');
      verify(() => shared.getString('key')).called(1);
    });

    test('returns null when key is absent', () {
      when(() => shared.getString('key')).thenReturn(null);

      check(prefs.getString('key')).isNull();
    });
  });

  group('setString', () {
    test('delegates to SharedPreferences and returns result', () async {
      when(() => shared.setString('key', 'hello')).thenAnswer((_) async => true);

      final result = await prefs.setString('key', 'hello');

      check(result).isTrue();
      verify(() => shared.setString('key', 'hello')).called(1);
    });
  });

  group('getBool', () {
    test('delegates to SharedPreferences and returns value', () {
      when(() => shared.getBool('key')).thenReturn(true);

      final result = prefs.getBool('key');

      check(result).isNotNull().isTrue();
      verify(() => shared.getBool('key')).called(1);
    });

    test('returns null when key is absent', () {
      when(() => shared.getBool('key')).thenReturn(null);

      check(prefs.getBool('key')).isNull();
    });
  });

  group('setBool', () {
    test('delegates to SharedPreferences and returns result', () async {
      when(() => shared.setBool('key', true)).thenAnswer((_) async => true);

      final result = await prefs.setBool('key', true);

      check(result).isTrue();
      verify(() => shared.setBool('key', true)).called(1);
    });
  });

  group('containsKey', () {
    test('returns true when key exists', () {
      when(() => shared.containsKey('key')).thenReturn(true);

      check(prefs.containsKey('key')).isTrue();
      verify(() => shared.containsKey('key')).called(1);
    });

    test('returns false when key is absent', () {
      when(() => shared.containsKey('key')).thenReturn(false);

      check(prefs.containsKey('key')).isFalse();
    });
  });

  group('remove', () {
    test('delegates to SharedPreferences and returns result', () async {
      when(() => shared.remove('key')).thenAnswer((_) async => true);

      final result = await prefs.remove('key');

      check(result).isTrue();
      verify(() => shared.remove('key')).called(1);
    });
  });

  group('clear', () {
    test('delegates to SharedPreferences and returns result', () async {
      when(() => shared.clear()).thenAnswer((_) async => true);

      final result = await prefs.clear();

      check(result).isTrue();
      verify(() => shared.clear()).called(1);
    });
  });

  group('reload', () {
    test('delegates to SharedPreferences', () async {
      when(() => shared.reload()).thenAnswer((_) async {});

      await prefs.reload();

      verify(() => shared.reload()).called(1);
    });
  });

  group('getKeys', () {
    test('delegates to SharedPreferences and returns key set', () {
      when(() => shared.getKeys()).thenReturn({'a', 'b'});

      final result = prefs.getKeys();

      check(result).deepEquals({'a', 'b'});
      verify(() => shared.getKeys()).called(1);
    });
  });
}
