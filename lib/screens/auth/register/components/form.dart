import 'package:flutter/material.dart';
import 'package:learn_brinvestyuk/constant/value.dart';
import 'package:learn_brinvestyuk/widgets/buttons/button.dart';
import 'package:learn_brinvestyuk/widgets/forms/text_field.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({
    Key? key,
    required this.emailController,
    this.emailOnTap,
    required this.emailChanges,
    required this.emailValid,
    required this.passwordController,
    this.passwordOnTap,
    required this.passwordChanges,
    required this.passValid,
    required this.passwordConrimController,
    this.passwordConfirmOnTap,
    required this.passwordConfirmChanges,
    required this.passConfirmValid,
    required this.button,
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
  final TextEditingController passwordConrimController;
  final VoidCallback? passwordConfirmOnTap;
  final ValueChanged<String>? passwordConfirmChanges;
  final bool passConfirmValid;
  final bool button;
  final VoidCallback? buttonOnPressed;

  @override
  _RegisterForm createState() => _RegisterForm();
}

class _RegisterForm extends State<RegisterForm> {
  bool pass = true;
  bool passConfirm = true;

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
        TextForm(
          editingController: widget.passwordConrimController..text,
          labelText: "Konfirmasi kata sandi",
          hintText: "******",
          isPassword: true,
          obscure: passConfirm,
          onTap: () => setState(
            () => passConfirm = !passConfirm,
          ),
          onChanged: widget.passwordConfirmChanges,
          validation: !widget.passConfirmValid
              ? Text(
                  "Kata sandi tidak sama",
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
                  onPressed: widget.buttonOnPressed ?? () => print("register"),
                  text: "Daftar",
                  radius: defaultRadius * 6,
                  letterSpacing: 1.2,
                )
              : DisabledButton(
                  text: "Daftar",
                  radius: defaultRadius * 6,
                  letterSpacing: 1.2,
                ),
        ),
      ],
    );
  }
}
