import 'package:flutter/material.dart';
import 'package:learn_brinvestyuk/constant/color.dart';
import 'package:learn_brinvestyuk/constant/value.dart';

class NumericPad extends StatelessWidget {
  const NumericPad({
    Key? key,
    required this.onNumberSelected,
  }) : super(key: key);

  final Function(int) onNumberSelected;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: size.height * .08,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildNumber(context, 1),
                buildNumber(context, 2),
                buildNumber(context, 3),
              ],
            ),
          ),
          Container(
            height: size.height * .08,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildNumber(context, 4),
                buildNumber(context, 5),
                buildNumber(context, 6),
              ],
            ),
          ),
          Container(
            height: size.height * .08,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildNumber(context, 7),
                buildNumber(context, 8),
                buildNumber(context, 9),
              ],
            ),
          ),
          Container(
            height: size.height * .08,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildEmptySpace(),
                buildNumber(context, 0),
                buildBackspace(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNumber(BuildContext context, int number) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onNumberSelected(number),
        child: Padding(
          padding: EdgeInsets.all(defaultPadding * 0.5),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(defaultRadius * 1.5),
              ),
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBackspace() {
    return Expanded(
      child: GestureDetector(
        onTap: () => onNumberSelected(-1),
        child: Padding(
          padding: EdgeInsets.all(defaultPadding * 0.5),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(defaultRadius * 1.5),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.backspace,
                size: 26,
                color: primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEmptySpace() {
    return Expanded(
      child: Container(),
    );
  }
}
