import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learn_brinvestyuk/constant/value.dart';

class ArticleSection extends StatelessWidget {
  const ArticleSection({
    Key? key,
    this.image,
    this.title,
    this.subtitle,
  }) : super(key: key);

  final String? image;
  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: size.width * .35,
            child: image != null
                ? CachedNetworkImage(
                    imageUrl: image!,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    "assets/images/article_1.png",
                    fit: BoxFit.cover,
                  ),
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(left: defaultPadding * .5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title ?? "Panduan Investasi untuk Pemula",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(height: defaultHeight * .2),
                  Text(
                    subtitle ??
                        "quarter crow's quarter crow's quarter crow's quarter crow's quarter crow's quarter...",
                    maxLines: 3,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
