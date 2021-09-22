import 'package:flutter/material.dart';
import 'package:learn_brinvestyuk/constant/color.dart';
import 'package:learn_brinvestyuk/constant/value.dart';
import 'package:learn_brinvestyuk/view_model/products/products_view_model.dart';
import 'package:learn_brinvestyuk/widgets/buttons/button.dart';

class ProductDetailDescription extends StatelessWidget {
  const ProductDetailDescription({
    Key? key,
    required this.products,
  }) : super(key: key);

  final ProductsViewModel products;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      width: size.width,
      margin: EdgeInsets.only(top: size.height * .3),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(defaultRadius * 3),
          topLeft: Radius.circular(defaultRadius * 3),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -5),
            color: Color(0xFF000000).withOpacity(.1),
            blurRadius: 5,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: defaultPadding * .6,
              vertical: defaultPadding * .3,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFFFE8D6),
              borderRadius: BorderRadius.all(
                Radius.circular(defaultRadius * 3),
              ),
            ),
            child: Text(
              products.category!,
              style: TextStyle(
                color: secondaryColor,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: defaultHeight * .5,
          ),
          Text(
            products.title!,
            style: textTheme.headline2,
          ),
          SizedBox(
            height: defaultHeight * .5,
          ),
          RichText(
            text: TextSpan(
              text: products.formatted?.currentAmount,
              style: textTheme.headline4,
              children: [
                TextSpan(
                  text: "   terkumpul dari   ",
                  style: textTheme.bodyText2,
                ),
                TextSpan(
                  text: products.formatted?.totalAmount,
                  style: textTheme.headline5,
                ),
              ],
            ),
          ),
          SizedBox(height: defaultHeight * .5),
          LinearProgressIndicator(
            backgroundColor: Color(0xfffd8300).withOpacity(.3),
            value: products.currentPercent,
            color: Color(0xfffd8300),
            minHeight: 5,
          ),
          SizedBox(
            height: defaultHeight * .5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                products.formatted!.roi!,
                style: textTheme.bodyText1,
              ),
              Text(
                products.formatted!.tenorDay!,
                style: textTheme.bodyText1,
              )
            ],
          ),
          SizedBox(
            height: defaultHeight * 2,
          ),
          Container(
            width: size.width,
            child: Center(
              child: SecondaryButton(
                onPressed: () => print("test"),
                text: "Beli sekarang",
                radius: 60,
              ),
            ),
          ),
          SizedBox(
            height: defaultHeight * 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.green[900],
                radius: 25,
                child: Text(
                  products.company!.substring(0, 1),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: defaultPadding * .5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    products.company!,
                    style: textTheme.subtitle1,
                  ),
                  SizedBox(height: defaultHeight * .3),
                  Row(
                    children: [
                      Icon(
                        Icons.verified_user_outlined,
                        color: Colors.green.withOpacity(.7),
                        size: 14,
                      ),
                      SizedBox(
                        width: defaultHeight * .2,
                      ),
                      Text(
                        "Akun terverifikasi",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black.withOpacity(.3),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: defaultHeight,
          ),
          Text(
            products.desc!,
            style: textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
