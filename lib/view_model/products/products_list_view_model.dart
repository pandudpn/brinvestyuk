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
      final List<ProductListModel>? response =
          await Product().fetchProducts(page, limit, sort);

      if (response != null) {
        this.products = response
            .map((product) => ProductsViewModel(product: product))
            .toList();
      }

      notifyListeners();
    } catch (e) {
      this.products = null;
    }
  }
}
