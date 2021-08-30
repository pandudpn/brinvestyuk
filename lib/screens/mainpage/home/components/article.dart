import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learn_brinvestyuk/constant/value.dart';
import 'package:learn_brinvestyuk/models/articles/article_list_model.dart';

class ArticleSection extends StatelessWidget {
  const ArticleSection({
    Key? key,
    this.articles,
  }) : super(key: key);

  final List<ArticleListModel>? articles;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      width: size.width,
      child: Column(
        children: _articles(context, size),
      ),
    );
  }

  List<Widget> _articles(BuildContext context, Size size) {
    List<Widget> lists = [];

    for (int i = 0; i < articles!.length; i++) {
      Widget p = Padding(
        padding: (i == articles!.length - 1)
            ? EdgeInsets.zero
            : EdgeInsets.only(bottom: defaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: articles![i].image!,
              height: size.height * .1,
              width: size.width * .35,
              fit: BoxFit.cover,
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(left: defaultPadding * .5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      articles![i].title ?? "Panduan Investasi untuk Pemula",
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(height: defaultHeight * .2),
                    Text(
                      articles![i].body ??
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

      lists.add(p);
    }

    return lists;
  }
}
