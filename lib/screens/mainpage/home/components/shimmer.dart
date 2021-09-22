import 'package:flutter/material.dart';
import 'package:learn_brinvestyuk/constant/color.dart';
import 'package:learn_brinvestyuk/constant/value.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

final Color shimmerColor = Colors.grey[300]!;

class ShimmerProfile extends StatelessWidget {
  const ShimmerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        children: <Widget>[
          Container(
            width: size.width,
            padding: EdgeInsets.only(
              bottom: defaultPadding,
              top: defaultPadding * .5,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "BRInvestYuk!",
                  style: TextStyle(
                    fontFamily: "CartoonMarker",
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    shadows: [
                      BoxShadow(offset: Offset(0, 2), blurRadius: 0),
                    ],
                  ),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 28,
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(defaultPadding),
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(defaultRadius * 1.6),
              boxShadow: [
                BoxShadow(
                    offset: Offset(5, 10),
                    blurRadius: 20,
                    color: Color(0xff000000).withOpacity(.3))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Shimmer(
                  child: Container(
                    color: shimmerColor,
                    height: 8,
                  ),
                ),
                SizedBox(
                  height: defaultHeight,
                ),
                Shimmer(
                  enabled: true,
                  child: Container(
                    color: shimmerColor,
                    width: 100,
                    height: 8,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ShimmerInvestment extends StatelessWidget {
  const ShimmerInvestment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(defaultPadding),
      margin: EdgeInsets.symmetric(horizontal: defaultPadding),
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(defaultRadius * 1.6),
        boxShadow: [
          BoxShadow(
            offset: Offset(5, 10),
            blurRadius: 20,
            color: Color(0xff000000).withOpacity(.3),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Total Investasi",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Lihat transaksi",
                      style: TextStyle(color: secondaryColor, fontSize: 12),
                    ),
                    Icon(
                      Icons.arrow_right_alt,
                      color: secondaryColor,
                      size: 18,
                    )
                  ],
                ),
              ),
            ],
          ),
          Shimmer(
            child: Container(
              color: shimmerColor,
              height: 15,
              width: double.infinity,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: defaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Total keuntungan",
                  style: Theme.of(context).textTheme.bodyText2,
                )
              ],
            ),
          ),
          Shimmer(
            child: Container(
              color: shimmerColor,
              height: 8,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}

class ShimmerProductSection extends StatelessWidget {
  const ShimmerProductSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Shimmer(
                    child: Container(
                      width: 250,
                      height: 110,
                      color: shimmerColor,
                    ),
                  ),
                  SizedBox(height: defaultHeight * .5),
                  Shimmer(
                    child: Container(
                      height: 10,
                      width: 250,
                      color: shimmerColor,
                    ),
                  ),
                  SizedBox(height: defaultHeight * .5),
                  Shimmer(
                    child: Container(
                      height: 8,
                      width: 250,
                      color: shimmerColor,
                    ),
                  ),
                  SizedBox(height: defaultHeight * .5),
                  Shimmer(
                    child: Container(
                      height: 8,
                      width: 250,
                      color: shimmerColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Shimmer(
                    child: Container(
                      width: 250,
                      height: 110,
                      color: shimmerColor,
                    ),
                  ),
                  SizedBox(height: defaultHeight * .5),
                  Shimmer(
                    child: Container(
                      height: 10,
                      width: 250,
                      color: shimmerColor,
                    ),
                  ),
                  SizedBox(height: defaultHeight * .5),
                  Shimmer(
                    child: Container(
                      height: 8,
                      width: 250,
                      color: shimmerColor,
                    ),
                  ),
                  SizedBox(height: defaultHeight * .5),
                  Shimmer(
                    child: Container(
                      height: 8,
                      width: 250,
                      color: shimmerColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerArticleSection extends StatelessWidget {
  const ShimmerArticleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      child: Padding(
        padding: EdgeInsets.only(bottom: defaultPadding, left: defaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Shimmer(
              child: Container(
                height: size.height * .1,
                width: size.width * .35,
                color: shimmerColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: defaultPadding * .5),
            ),
            Column(
              children: [
                Shimmer(
                  child: Container(
                    height: 12,
                    width: size.width * .51,
                    color: shimmerColor,
                  ),
                ),
                SizedBox(
                  height: defaultPadding * .5,
                ),
                Shimmer(
                  child: Container(
                    height: 7,
                    width: size.width * .51,
                    color: shimmerColor,
                  ),
                ),
                SizedBox(
                  height: defaultPadding * .5,
                ),
                Shimmer(
                  child: Container(
                    height: 7,
                    width: size.width * .51,
                    color: shimmerColor,
                  ),
                ),
                SizedBox(
                  height: defaultPadding * .5,
                ),
                Shimmer(
                  child: Container(
                    height: 7,
                    width: size.width * .51,
                    color: shimmerColor,
                  ),
                ),
                SizedBox(
                  height: defaultPadding * .5,
                ),
                Shimmer(
                  child: Container(
                    height: 7,
                    width: size.width * .51,
                    color: shimmerColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: defaultPadding,
            ),
          ],
        ),
      ),
    );
  }
}
