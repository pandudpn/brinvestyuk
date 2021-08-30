import 'package:learn_brinvestyuk/models/products/product_list_model.dart';

class ProductsViewModel {
  ProductListModel? _productListModel;

  ProductsViewModel({ProductListModel? product}) : _productListModel = product;

  int? get id => _productListModel?.id;

  String? get title => _productListModel?.name;

  String? get desc => _productListModel?.desc;

  String? get image => _productListModel?.image;

  String? get company => _productListModel?.company;

  String? get category => _productListModel?.category;

  String? get startTime => _productListModel?.startDate.toString();

  String? get endTime => _productListModel?.endDate.toString();

  DateTime? get offerTime => _productListModel?.offerDate;

  int? get minimal => _productListModel?.minAmount;

  int? get currentAmount => _productListModel?.currentAmount;

  int? get totalAmount => _productListModel?.totalAmount;

  double? get currentPercent {
    double a = _productListModel?.percent ?? 0;
    return a / 100;
  }

  double? get roi => _productListModel?.roi;

  double? get tenor => _productListModel?.tenorDay;

  String? get totalTenorInMonth {
    int total = (tenor! / 30).floor();
    if (total < 1) {
      return "$tenor! hari";
    }

    return "$total bulan";
  }

  ProductListFormatted? get formatted => _productListModel?.formatted;
}
