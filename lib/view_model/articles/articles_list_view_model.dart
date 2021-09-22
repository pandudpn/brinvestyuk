import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_brinvestyuk/models/articles/article_list_model.dart';
import 'package:learn_brinvestyuk/models/error_model.dart';
import 'package:learn_brinvestyuk/services/article/article.dart';
import 'package:learn_brinvestyuk/view_model/articles/articles_view_model.dart';

class ArticlesListViewModel with ChangeNotifier {
  ArticlesViewModel? articles = ArticlesViewModel();

  Future<void> fetchArticles(int? page) async {
    page ??= 1;
    try {
      final ArticleModel? response = await Article().fetchArticles(page);
      if (response != null) {
        this.articles = ArticlesViewModel(article: response);
      }
    } catch (e) {
      this.articles = null;
    }
  }
}
