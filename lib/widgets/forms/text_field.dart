import 'package:flutter/material.dart';
import 'package:learn_brinvestyuk/constant/value.dart';

class TextForm extends StatelessWidget {
  const TextForm({
    Key? key,
    required this.editingController,
    required this.labelText,
    required this.hintText,
    required this.isPassword,
    this.obscure,
    this.autoFocus,
    this.onChanged,
    this.onTap,
    this.decoration,
    this.validation,
  }) : super(key: key);

  final String labelText;
  final String hintText;
  final bool isPassword;
  final bool? obscure;
  final bool? autoFocus;

  final TextEditingController editingController;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final InputDecoration? decoration;
  final Widget? validation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: defaultPadding * .5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            labelText,
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: defaultHeight * .5,
          ),
          TextFormField(
            autofocus: autoFocus ?? false,
            controller: editingController,
            obscureText: obscure ?? false,
            onChanged: onChanged,
            decoration: decoration ??
                InputDecoration(
                  hintText: hintText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius * 2),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  suffixIcon: isPassword
                      ? Padding(
                          padding: EdgeInsetsDirectional.only(
                              end: defaultPadding * .5),
                          child: GestureDetector(
                            child: obscure!
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                            onTap: isPassword ? onTap ?? null : null,
                          ),
                        )
                      : null,
                ),
          ),
          Container(
            child: validation,
          ),
        ],
      ),
    );
  }
}
