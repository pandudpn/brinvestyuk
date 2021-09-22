import 'package:dio/dio.dart';
import 'package:learn_brinvestyuk/helpers/store_management.dart';
import 'package:learn_brinvestyuk/models/error_model.dart';
import 'package:learn_brinvestyuk/models/products/product_list_model.dart';
import 'package:learn_brinvestyuk/services/api.dart';

class Product {
  String? _token = StorageManagement().token;

  Future<List<ProductListModel>?> fetchProducts(
      int? page, int? limit, String? sort) async {
    page ??= 1;
    limit ??= 10;

    String url = sort == null
        ? "/products?limit=$limit&page=$page"
        : "/products?limit=$limit&page=$page&sort=$sort";

    Options options = Options(headers: {
      "Authorization": _token,
      "Content-Type": "application/json",
    });

    try {
      final Map<String, dynamic>? res = await Api.get(url, options);

      Iterable list = res?["data"];
      return list.map((product) => ProductListModel.fromJson(product)).toList();
    } on Exception catch (e) {
      throw e;
    }
  }
}
