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
      final LoginModel? response = await Login().loginUser(email, password);

      if (response != null) {
        this.login = LoginViewModel(login: response);
      }

      notifyListeners();
    } catch (e) {
      this.login = null;
    }
  }
}
