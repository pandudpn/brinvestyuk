import 'package:json_annotation/json_annotation.dart';

part 'product_list_model.g.dart';

@JsonSerializable()
class ProductListModel {
  final int? id;
  final String? name;
  final String? image;

  @JsonKey(name: "description")
  final String? desc;
  final String? company;
  final String? category;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? offerDate;
  final DateTime? createdAt;
  final int? minAmount;
  final int? currentAmount;
  final int? totalAmount;
  final double? percent;
  final double? roi;
  final double? tenorDay;

  @JsonKey(name: "formatted")
  final ProductListFormatted? formatted;

  ProductListModel({
    this.id,
    this.name,
    this.image,
    this.desc,
    this.company,
    this.category,
    this.startDate,
    this.endDate,
    this.offerDate,
    this.createdAt,
    this.currentAmount,
    this.minAmount,
    this.totalAmount,
    this.percent,
    this.roi,
    this.tenorDay,
    this.formatted,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      _$ProductListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductListModelToJson(this);
}

@JsonSerializable()
class ProductListFormatted {
  final String? minAmount;
  final String? currentAmount;
  final String? totalAmount;
  final String? percent;
  final String? roi;
  final String? startDate;
  final String? endDate;
  final String? tenorDay;

  ProductListFormatted({
    this.minAmount,
    this.currentAmount,
    this.endDate,
    this.percent,
    this.roi,
    this.startDate,
    this.tenorDay,
    this.totalAmount,
  });

  factory ProductListFormatted.fromJson(Map<String, dynamic> json) =>
      _$ProductListFormattedFromJson(json);

  Map<String, dynamic> toJson() => _$ProductListFormattedToJson(this);
}
