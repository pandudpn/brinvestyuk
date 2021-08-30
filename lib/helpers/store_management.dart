import 'package:shared_preferences/shared_preferences.dart';

class StorageManagement {
  static SharedPreferences? _sharedPrefs;

  factory StorageManagement() => StorageManagement._internal();

  StorageManagement._internal();

  Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  String? get token => _sharedPrefs?.getString("token");

  set token(String? value) {
    _sharedPrefs?.setString("token", value ?? "");
  }

  bool get firstInstall => _sharedPrefs?.getBool("firstInstall") ?? true;

  set firstInstall(bool value) {
    _sharedPrefs?.setBool("firstInstall", value);
  }
}
