import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_brinvestyuk/models/auth/login_model.dart';
import 'package:learn_brinvestyuk/models/error_model.dart';
import 'package:learn_brinvestyuk/services/auth/login.dart';
import 'package:learn_brinvestyuk/view_model/auth/login/login_view_model.dart';

class LoginListViewModel with ChangeNotifier {
  LoginViewModel? login;

  Future<void> doLogin(String email, String password) async {
    try {
      dynamic response = await Login().loginUser(email, password);

      if (response is ErrorModel) {
        this.login = null;
        print("error " + response.code + " reason is " + response.reason);
        Fluttertoast.showToast(msg: response.reason);
      } else if (response is LoginModel) {
        this.login = LoginViewModel(login: response);
      }

      notifyListeners();
    } catch (e) {
      this.login = null;
      Fluttertoast.showToast(
          msg:
              "Terjadi kesalahan pada server, silahkan coba beberapa saat lagi");
    }
  }
}
