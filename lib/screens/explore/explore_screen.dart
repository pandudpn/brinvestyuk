import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_brinvestyuk/constant/value.dart';
import 'package:learn_brinvestyuk/screens/explore/components/button.dart';
import 'package:learn_brinvestyuk/screens/explore/components/page.dart';
import 'package:learn_brinvestyuk/screens/explore/components/text.dart';
import 'package:learn_brinvestyuk/services/api.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);

  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SvgPicture.asset(
                "assets/images/onboard/onboard_top.svg",
                height: size.height * 0.14,
              ),
              SizedBox(
                height: defaultHeight,
              ),
              PageExplore(),
              SizedBox(
                height: defaultHeight,
              ),
              ButtonExplore()
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Press again to exit");
      return false;
    }

    currentBackPressTime = null;
    return true;
  }
}
