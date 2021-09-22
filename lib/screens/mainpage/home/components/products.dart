import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learn_brinvestyuk/constant/value.dart';
import 'package:learn_brinvestyuk/screens/mainpage/product/product_detail_screen.dart';
import 'package:learn_brinvestyuk/view_model/products/products_view_model.dart';

class ProductSection extends StatefulWidget {
  const ProductSection({Key? key, this.products}) : super(key: key);

  final List<ProductsViewModel>? products;

  _ProductSectionState createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: ClampingScrollPhysics(),
      child: Row(
        children: _products(),
      ),
    );
  }

  List<Widget> _products() {
    List<Widget> lists = <Widget>[];

    for (int i = 0; i < widget.products!.length; i++) {
      Widget p = GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              products: widget.products![i],
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 250,
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  image: DecorationImage(
                    image: NetworkImage(widget.products![i].image!),
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
                          child: Text(widget.products![i].formatted!.roi!,
                              style: Theme.of(context).textTheme.bodyText2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: defaultHeight * .5),
              Container(
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.products![i].title!,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(height: defaultHeight * .5),
                    LinearProgressIndicator(
                      backgroundColor: Color(0xfffd8300).withOpacity(.3),
                      value: widget.products![i].currentPercent,
                      color: Color(0xfffd8300),
                      minHeight: 5,
                    ),
                    SizedBox(height: defaultHeight * .5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          widget.products![i].formatted!.totalAmount!,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          widget.products![i].totalTenorInMonth!,
                          style: Theme.of(context).textTheme.bodyText1,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );

      lists.add(p);
    }

    return lists;
  }
}
