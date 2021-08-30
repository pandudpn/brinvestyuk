import 'package:dio/dio.dart';
import 'package:learn_brinvestyuk/helpers/store_management.dart';
import 'package:learn_brinvestyuk/models/error_model.dart';
import 'package:learn_brinvestyuk/models/products/product_list_model.dart';
import 'package:learn_brinvestyuk/services/api.dart';

class Product {
  String? _baseUrl = Api().baseUrl;
  String? _token = StorageManagement().token;

  Future<dynamic> fetchProducts(int? page, int? limit, String? sort) async {
    page ??= 1;
    limit ??= 10;
    sort ??= "Latest";

    Options options = Options(headers: {
      "Authorization": _token,
      "Content-Type": "application/json",
    });

    try {
      final res = await Api.get(
          "$_baseUrl/products?limit=$limit&page=$page&sort=$sort", options);

      if (res is ErrorModel) {
        return res;
      }

      if (res["data"] == null) {
        return null;
      }

      Iterable list = res["data"];
      return list.map((product) => ProductListModel.fromJson(product)).toList();
    } on Exception catch (e) {
      print("error fetch product $e");

      throw e;
    }
  }
}
