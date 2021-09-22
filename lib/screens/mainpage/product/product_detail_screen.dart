import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_brinvestyuk/constant/color.dart';
import 'package:learn_brinvestyuk/constant/value.dart';
import 'package:learn_brinvestyuk/screens/mainpage/product/components/product_detail_description.dart';
import 'package:learn_brinvestyuk/view_model/products/products_view_model.dart';
import 'package:learn_brinvestyuk/widgets/buttons/button.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    Key? key,
    required this.products,
  }) : super(key: key);

  final ProductsViewModel products;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height * .35,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(products.image!),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding,
                        vertical: defaultPadding * .5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(defaultPadding * .25),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(5, 10),
                                  color: Color(0xFF000000).withOpacity(.3),
                                  blurRadius: 5,
                                )
                              ],
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(defaultRadius * 5),
                            ),
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(defaultPadding * .2),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(5, 10),
                                      color: Color(0xFF000000).withOpacity(.3),
                                      blurRadius: 5,
                                    )
                                  ],
                                  borderRadius:
                                      BorderRadius.circular(defaultRadius * 5),
                                ),
                                child: GestureDetector(
                                  child: Icon(
                                    Icons.share_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                padding: EdgeInsets.all(defaultPadding * .2),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(5, 10),
                                      color: Color(0xFF000000).withOpacity(.3),
                                      blurRadius: 5,
                                    )
                                  ],
                                  borderRadius:
                                      BorderRadius.circular(defaultRadius * 5),
                                ),
                                child: GestureDetector(
                                  child: Icon(
                                    Icons.more_vert,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ProductDetailDescription(products: products)
          ],
        ),
      ),
    );
  }
}
