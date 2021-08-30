import 'package:flutter/material.dart';
import 'package:learn_brinvestyuk/constant/color.dart';
import 'package:learn_brinvestyuk/constant/value.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
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

    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          primaryColor,
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
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 15,
              letterSpacing: letterSpacing,
            ),
          ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
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

    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          secondaryColor,
        ),
        padding:
            MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(
          vertical: size.width * 0.03,
          horizontal: size.width * 0.25,
        )),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        animationDuration: Duration(seconds: 700),
      ),
      child: child ??
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 15,
              letterSpacing: letterSpacing,
            ),
          ),
    );
  }
}

class DisabledButton extends StatelessWidget {
  const DisabledButton({
    Key? key,
    this.child,
    this.text = "",
    this.letterSpacing = 1,
    this.radius = defaultRadius,
  }) : super(key: key);

  final Widget? child;
  final String text;
  final double letterSpacing;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return TextButton(
      onPressed: null,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Color(0xff000000).withOpacity(.2),
        ),
        padding:
            MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(
          vertical: size.width * 0.03,
          horizontal: size.width * 0.25,
        )),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        animationDuration: Duration(seconds: 700),
      ),
      child: child ??
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 15,
              letterSpacing: letterSpacing,
            ),
          ),
    );
  }
}
