import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_brinvestyuk/models/auth/login_model.dart';
import 'package:learn_brinvestyuk/models/error_model.dart';
import 'package:learn_brinvestyuk/services/api.dart';

class Login {
  String _baseUrl = Api().baseUrl;

  Future<dynamic> loginUser(String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };

    Options options = Options(headers: {
      "x-api-key": "0d8889998ae4f692794200d11d4e0d6278e169da",
      "Content-type": "application/json",
    });

    try {
      final res =
          await Api.postJson("$_baseUrl/auth/login/users", data, options);

      if (res is ErrorModel) {
        return res;
      }

      return LoginModel.fromJson(res["data"]);
    } on Exception catch (e) {
      print("error on login service " + e.toString());
      throw e;
    }
  }
}
