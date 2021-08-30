import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn_brinvestyuk/constant/value.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    image: DecorationImage(
                      image: AssetImage("assets/images/product_1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(defaultRadius),
                          child: Container(
                            padding: EdgeInsets.all(defaultPadding * .4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                            ),
                            child: Text("3,6% per tahun",
                                style: Theme.of(context).textTheme.bodyText2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: defaultHeight * .5),
                Container(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Deposito BRI 3 Bulan",
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      SizedBox(height: defaultHeight * .5),
                      LinearProgressIndicator(
                        backgroundColor: Color(0xfffd8300).withOpacity(.3),
                        value: .5,
                        color: Color(0xfffd8300),
                        minHeight: 5,
                      ),
                      SizedBox(height: defaultHeight * .5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Rp 35.000.000",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            "3 Bulan",
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
