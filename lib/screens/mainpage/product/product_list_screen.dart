import 'package:flutter/material.dart';
import 'package:learn_brinvestyuk/constant/color.dart';
import 'package:learn_brinvestyuk/constant/value.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        flexibleSpace: Container(
          // padding: EdgeInsets.only(top: defaultPadding * 2.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "List Produk Investasi",
                style: textTheme.headline4,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: primaryColor,
          ),
        ),
        // toolbarHeight: 100,
        // title: Padding(
        //   padding: EdgeInsets.only(top: defaultPadding),
        //   child: RichText(
        //     text: TextSpan(
        //       text: "List Produk Investasi",
        //       style: textTheme.headline4,
        //       children: [
        //         TextSpan(text: "\n"),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
