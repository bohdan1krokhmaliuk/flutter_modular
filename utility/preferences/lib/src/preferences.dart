import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class Preferences {
  const Preferences(this._shared);

  final SharedPreferences _shared;

  double? getDouble(String key) => _shared.getDouble(key);
  Future<bool> setDouble(String key, double value) =>
      _shared.setDouble(key, value);

  int? getInt(String key) => _shared.getInt(key);
  Future<bool> setInt(String key, int value) => _shared.setInt(key, value);

  String? getString(String key) => _shared.getString(key);
  Future<bool> setString(String key, String value) =>
      _shared.setString(key, value);

  bool? getBool(String key) => _shared.getBool(key);
  Future<bool> setBool(String key, bool value) => _shared.setBool(key, value);

  bool containsKey(String key) => _shared.containsKey(key);

  Future<bool> remove(String key) => _shared.remove(key);
  Future<bool> clear() => _shared.clear();
  Future<void> reload() => _shared.reload();
  Set<String> getKeys() => _shared.getKeys();
}
