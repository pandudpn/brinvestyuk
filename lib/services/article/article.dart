import 'package:dio/dio.dart';
import 'package:learn_brinvestyuk/helpers/store_management.dart';
import 'package:learn_brinvestyuk/models/articles/article_list_model.dart';
import 'package:learn_brinvestyuk/models/error_model.dart';
import 'package:learn_brinvestyuk/services/api.dart';

class Article {
  String? _token = StorageManagement().token;

  Future<ArticleModel?> fetchArticles(int page) async {
    Options options = Options(headers: {
      "Authorization": _token,
      "Content-Type": "application/json",
    });

    try {
      final res = await Api.get("/articles?page=$page", options);

      return ArticleModel.fromJson(res?["data"]);
    } on Exception catch (e) {
      print("error fetch article $e");

      throw e;
    }
  }
}
