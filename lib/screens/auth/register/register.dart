import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:learn_brinvestyuk/constant/value.dart';
import 'package:learn_brinvestyuk/screens/auth/register/components/form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  bool visible = false;
  bool _button = false;
  bool _emailValid = true;
  bool _passValid = true;
  bool _passConfirm = true;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          padding: EdgeInsets.all(defaultPadding * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Container()),
              Center(
                child: Text(
                  "Sign Up",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              SizedBox(
                height: defaultHeight,
              ),
              Center(
                child: Text(
                  "Yuk, mulai berinvestasi dengan cara yang mudah",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              SizedBox(
                height: defaultPadding * 3,
              ),
              RegisterForm(
                button: _button,
                emailController: emailController,
                emailValid: _emailValid,
                emailChanges: (val) => setState(() {
                  if (EmailValidator.validate(emailController.text)) {
                    _emailValid = true;
                    if (_passValid &&
                        _passConfirm &&
                        passwordConfirmController.text != "") {
                      _button = true;
                    } else {
                      _button = false;
                    }
                  } else {
                    _emailValid = false;
                    _button = false;
                  }
                }),
                passwordController: passwordController,
                passValid: _passValid,
                passwordChanges: (val) => setState(() {
                  if (val.length > 5) {
                    _passValid = true;
                    if (val != passwordConfirmController.text) {
                      if (passwordConfirmController.text != "") {
                        _passConfirm = false;
                      }
                      _button = false;
                    } else {
                      _passConfirm = true;
                      _button = _emailValid && emailController.text != "";
                    }
                  } else {
                    _passValid = false;
                    _button = false;
                  }
                }),
                passwordConrimController: passwordConfirmController,
                passConfirmValid: _passConfirm,
                passwordConfirmChanges: (value) => setState(
                  () {
                    if (value.length > 5) {
                      if (value == passwordController.text) {
                        _passConfirm = true;
                        _passValid = true;
                        _button = _emailValid && emailController.text != "";
                      } else {
                        _passConfirm = false;
                        _button = false;
                      }
                    } else {
                      _passConfirm = false;
                      _button = false;
                    }
                  },
                ),
              ),
              Expanded(flex: 2, child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
