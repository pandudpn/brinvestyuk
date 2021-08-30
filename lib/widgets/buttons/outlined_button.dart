import 'package:flutter/material.dart';
import 'package:learn_brinvestyuk/constant/color.dart';
import 'package:learn_brinvestyuk/constant/value.dart';

class PrimaryOutlinedButton extends StatelessWidget {
  const PrimaryOutlinedButton({
    Key? key,
    required this.onPressed,
    this.child,
    this.text = "",
    this.letterSpacing = 1,
    this.radius = defaultRadius,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Widget? child;
  final String text;
  final double letterSpacing;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          BorderSide(
            color: primaryColor,
            width: 1.3,
            style: BorderStyle.solid,
          ),
        ),
        padding:
            MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(
          vertical: size.width * 0.03,
          horizontal: size.width * 0.25,
        )),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide.none,
          ),
        ),
        animationDuration: Duration(seconds: 700),
      ),
      child: child ??
          Text(
            text,
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 15,
              letterSpacing: letterSpacing,
            ),
          ),
    );
  }
}

class SecondaryOutlinedButton extends StatelessWidget {
  const SecondaryOutlinedButton({
    Key? key,
    required this.onPressed,
    this.child,
    this.text = "",
    this.letterSpacing = 1,
    this.radius = defaultRadius,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Widget? child;
  final String text;
  final double letterSpacing;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          BorderSide(
            color: secondaryColor,
            width: 1.3,
            style: BorderStyle.solid,
          ),
        ),
        padding:
            MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(
          vertical: size.width * 0.03,
          horizontal: size.width * 0.25,
        )),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide.none,
          ),
        ),
        animationDuration: Duration(seconds: 700),
      ),
      child: child ??
          Text(
            text,
            style: TextStyle(
              color: secondaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 15,
              letterSpacing: letterSpacing,
            ),
          ),
    );
  }
}
