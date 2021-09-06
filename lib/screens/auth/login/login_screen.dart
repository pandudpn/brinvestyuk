import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:learn_brinvestyuk/constant/value.dart';
import 'package:learn_brinvestyuk/helpers/store_management.dart';
import 'package:learn_brinvestyuk/screens/auth/login/components/form.dart';
import 'package:learn_brinvestyuk/screens/mainpage/main_page.dart';
import 'package:learn_brinvestyuk/services/api.dart';
import 'package:learn_brinvestyuk/view_model/auth/login/login_list_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final StorageManagement storage = StorageManagement();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool visible = false;
  bool _button = false;
  bool _isRequest = false;
  bool _emailValid = true;
  bool _passValid = true;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          padding: EdgeInsets.all(defaultPadding * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  "Login",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              SizedBox(
                height: defaultHeight,
              ),
              Center(
                child: Text(
                  "Selamat datang kembali, Yuk berinvestasi \ndi BRInvest",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              SizedBox(
                height: defaultPadding * 3,
              ),
              Center(
                child: LoginForm(
                  button: _button,
                  isRequest: _isRequest,
                  emailController: emailController,
                  emailValid: _emailValid,
                  emailChanges: (val) => setState(
                    () {
                      if (EmailValidator.validate(emailController.text)) {
                        _emailValid = true;
                        if (_passValid && passwordController.text != "") {
                          _button = true;
                        } else {
                          _button = false;
                        }
                      } else {
                        _emailValid = false;
                        _button = false;
                      }
                    },
                  ),
                  passwordController: passwordController,
                  passValid: _passValid,
                  passwordChanges: (val) => setState(
                    () {
                      if (val.length > 5) {
                        _passValid = true;
                        _button = _emailValid && emailController.text != "";
                      } else {
                        _passValid = false;
                        _button = false;
                      }
                    },
                  ),
                  buttonOnPressed: () => _doLogin(
                    emailController.text,
                    passwordController.text,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _doLogin(String email, String password) async {
    setState(() {
      _isRequest = true;
    });

    try {
      final resLogin = Provider.of<LoginListViewModel>(context, listen: false);
      await resLogin.doLogin(email, password);

      if (resLogin.login != null) {
        storage.token = resLogin.login?.token;
        _isRequest = false;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainPage(),
          ),
        );
      } else {
        setState(() {
          _isRequest = false;
          _button = false;
        });
      }
    } catch (e) {
      setState(() {
        _isRequest = false;
        _button = false;
      });
      print(e);
    }
  }
}
