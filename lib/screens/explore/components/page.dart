import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn_brinvestyuk/constant/color.dart';
import 'package:learn_brinvestyuk/constant/value.dart';

class PageExplore extends StatelessWidget {
  const PageExplore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.55,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: defaultHeight,
            ),
            Center(
              child: SvgPicture.asset(
                "assets/images/onboard/explore.svg",
                height: size.height * 0.35,
                width: size.width,
              ),
            ),
            SizedBox(
              height: defaultHeight * 2,
            ),
            Center(
              child: Text(
                'Tunggu Apalagi "BeR-Invest-Yuk"!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: defaultHeight,
            ),
            Text(
              'Makan Bareng Sudah Biasa, Nongkrong Bareng Sudah Biasa, Yang Luar Biasa itu Investasi Bareng',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
