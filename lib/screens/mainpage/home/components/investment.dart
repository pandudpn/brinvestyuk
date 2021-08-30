import 'package:flutter/material.dart';
import 'package:learn_brinvestyuk/constant/color.dart';
import 'package:learn_brinvestyuk/constant/value.dart';

class InvestmentSection extends StatelessWidget {
  const InvestmentSection({
    Key? key,
    this.total,
    this.profit,
  }) : super(key: key);

  final String? total;
  final String? profit;

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
          Container(
            padding: EdgeInsets.symmetric(vertical: defaultPadding * .2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  total ?? "Rp 0",
                  style: Theme.of(context).textTheme.headline3,
                )
              ],
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
          Container(
            padding: EdgeInsets.only(top: defaultPadding * .2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  profit ?? "Rp 0",
                  style: Theme.of(context).textTheme.headline5,
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: defaultPadding * .7),
            child: ElevatedButton(
              onPressed: () => print("cobain"),
              child: Text(
                "+ Cobain Investasi",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: "CartoonMarker",
                  letterSpacing: 1.2,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(primaryColor),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(
                    vertical: defaultPadding * .6,
                    horizontal: defaultPadding * 4,
                  ),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultRadius * 1.6),
                    side: BorderSide(
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
