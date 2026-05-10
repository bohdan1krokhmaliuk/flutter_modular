import 'package:mocktail/mocktail.dart';
import 'package:preferences/preferences.dart';

final _storage = <String, dynamic>{};

class MockPreferences extends Mock implements Preferences {}

Preferences setupPreferences() {
  final mock = MockPreferences();

  when(() => mock.getBool(any())).thenAnswer(_get);
  when(() => mock.getInt(any())).thenAnswer(_get);
  when(() => mock.getString(any())).thenAnswer(_get);
  when(() => mock.getDouble(any())).thenAnswer(_get);

  when(() => mock.setBool(any(), any())).thenAnswer(_set);
  when(() => mock.setInt(any(), any())).thenAnswer(_set);
  when(() => mock.setString(any(), any())).thenAnswer(_set);
  when(() => mock.setDouble(any(), any())).thenAnswer(_set);

  when(
    () => mock.containsKey(any()),
  ).thenAnswer((inv) => _storage.containsKey(inv.key));

  when(mock.getKeys).thenAnswer((inv) => _storage.keys.toSet());

  when(() => mock.remove(any())).thenAnswer((inv) async {
    _storage.remove(inv.key);
    return true;
  });

  when(mock.clear).thenAnswer((_) async {
    _storage.clear();
    return true;
  });

  return mock;
}

T? _get<T>(Invocation inv) =>
    _storage.containsKey(inv.key) ? _storage[inv.key] as T : null;

Future<bool> _set<T>(Invocation inv) async {
  _storage[inv.key] = inv.value as T;
  return true;
}

extension on Invocation {
  String get key => positionalArguments[0] as String;
  dynamic get value => positionalArguments[1];
}
