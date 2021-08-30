import 'package:flutter/material.dart';
import 'package:learn_brinvestyuk/constant/value.dart';
import 'package:learn_brinvestyuk/widgets/buttons/button.dart';
import 'package:learn_brinvestyuk/widgets/forms/text_field.dart';

class LoginForm extends StatefulWidget {
  LoginForm({
    Key? key,
    required this.emailController,
    this.emailOnTap,
    required this.emailChanges,
    required this.emailValid,
    required this.passwordController,
    this.passwordOnTap,
    required this.passwordChanges,
    required this.passValid,
    required this.button,
    required this.isRequest,
    this.buttonOnPressed,
  }) : super(key: key);

  final TextEditingController emailController;
  final VoidCallback? emailOnTap;
  final ValueChanged<String>? emailChanges;
  final bool emailValid;
  final TextEditingController passwordController;
  final VoidCallback? passwordOnTap;
  final ValueChanged<String>? passwordChanges;
  final bool passValid;
  final bool button;
  final bool isRequest;
  final VoidCallback? buttonOnPressed;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool pass = true;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TextForm(
          editingController: widget.emailController..text,
          labelText: "Alamat e-mail",
          hintText: "email@email.com",
          isPassword: false,
          onChanged: widget.emailChanges,
          validation: !widget.emailValid
              ? Text(
                  "Harus berupa e-mail yang valid",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                )
              : null,
        ),
        TextForm(
          editingController: widget.passwordController..text,
          labelText: "Kata sandi",
          hintText: "*******",
          isPassword: true,
          obscure: pass,
          onTap: () => setState(
            () => pass = !pass,
          ),
          onChanged: widget.passwordChanges,
          validation: !widget.passValid
              ? Text(
                  "Minimum 6 karakter",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                )
              : null,
        ),
        SizedBox(
          height: defaultPadding,
        ),
        Container(
          width: size.width * .8,
          child: widget.button
              ? SecondaryButton(
                  onPressed: widget.buttonOnPressed != null
                      ? !widget.isRequest
                          ? widget.buttonOnPressed!
                          : () => print("sedang request")
                      : () => print("login"),
                  text: "Masuk",
                  radius: defaultRadius * 6,
                  letterSpacing: 1.2,
                  child: widget.isRequest
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : null,
                )
              : DisabledButton(
                  text: "Masuk",
                  radius: defaultRadius * 6,
                  letterSpacing: 1.2,
                ),
        ),
      ],
    );
  }
}
