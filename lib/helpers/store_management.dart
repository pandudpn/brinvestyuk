import 'package:shared_preferences/shared_preferences.dart';

class StorageManagement {
  static SharedPreferences? _sharedPrefs;

  factory StorageManagement() => StorageManagement._internal();

  StorageManagement._internal();

  Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  Future<void> removeToken() async {
    _sharedPrefs?.remove("token");
  }

  String? get token => _sharedPrefs?.getString("token") ?? null;

  set token(String? value) {
    if (value == null) {
      _sharedPrefs?.remove("token");
    } else {
      _sharedPrefs?.setString("token", value);
    }
  }

  bool get firstInstall => _sharedPrefs?.getBool("firstInstall") ?? true;

  set firstInstall(bool value) {
    _sharedPrefs?.setBool("firstInstall", value);
  }
}
