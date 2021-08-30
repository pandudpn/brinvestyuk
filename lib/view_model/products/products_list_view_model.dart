import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_brinvestyuk/models/error_model.dart';
import 'package:learn_brinvestyuk/models/products/product_list_model.dart';
import 'package:learn_brinvestyuk/services/product/product.dart';
import 'package:learn_brinvestyuk/view_model/products/products_view_model.dart';

class ProductsListViewModel with ChangeNotifier {
  List<ProductsViewModel>? products = <ProductsViewModel>[];

  Future<void> fetchProducts(int? page, int? limit, String? sort) async {
    try {
      dynamic response = await Product().fetchProducts(page, limit, sort);

      if (response is ErrorModel) {
        this.products = null;
        print("error " + response.code + " reason is " + response.reason);
        Fluttertoast.showToast(msg: response.reason);
      } else if (response is List<ProductListModel>) {
        // ignore: unnecessary_null_comparison
        if (response != null) {
          this.products = response
              .map((product) => ProductsViewModel(product: product))
              .toList();
        } else {
          this.products = null;
        }
      }

      notifyListeners();
    } catch (e) {
      print(e);
      this.products = null;
      Fluttertoast.showToast(
          msg:
              "Terjadi kesalahan pada server, silahkan coba beberapa saat lagi");
    }
  }
}
