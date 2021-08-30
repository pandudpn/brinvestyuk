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
      final response = await Article().fetchArticles(page);

      if (response is ErrorModel) {
        this.articles = null;
        Fluttertoast.showToast(msg: response.reason);
      } else if (response is ArticleModel) {
        this.articles =
            // ignore: unnecessary_null_comparison
            response != null ? ArticlesViewModel(article: response) : null;
      }
    } catch (e) {
      print("error $e");
      this.articles = null;
      Fluttertoast.showToast(
          msg:
              "Terjadi kesalahan pada server, silahkan coba beberapa saat lagi");
    }
  }
}
