import 'package:learn_brinvestyuk/models/auth/login_model.dart';

class LoginViewModel {
  LoginModel _loginModel;

  LoginViewModel({required LoginModel login}) : _loginModel = login;

  String get accessToken {
    return _loginModel.accessToken;
  }

  String get tokenType {
    return _loginModel.tokenType;
  }

  String get token {
    return "$tokenType $accessToken";
  }
}
