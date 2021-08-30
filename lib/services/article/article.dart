import 'package:dio/dio.dart';
import 'package:learn_brinvestyuk/helpers/store_management.dart';
import 'package:learn_brinvestyuk/models/articles/article_list_model.dart';
import 'package:learn_brinvestyuk/models/error_model.dart';
import 'package:learn_brinvestyuk/services/api.dart';

class Article {
  String _baseUrl = Api().baseUrl;
  String? _token = StorageManagement().token;

  Future<dynamic> fetchArticles(int page) async {
    Options options = Options(headers: {
      "Authorization": _token,
      "Content-Type": "application/json",
    });

    try {
      final res = await Api.get("$_baseUrl/articles?page=$page", options);

      if (res is ErrorModel) {
        return res;
      }

      return ArticleModel.fromJson(res["data"]);
    } on Exception catch (e) {
      print("error fetch article $e");

      throw e;
    }
  }
}
