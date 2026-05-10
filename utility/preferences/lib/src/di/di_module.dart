import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class PreferencesModule {
  @singleton
  @preResolve
  Future<SharedPreferences> get preferences => SharedPreferences.getInstance();
}
