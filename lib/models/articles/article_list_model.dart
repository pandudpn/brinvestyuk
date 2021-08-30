import 'package:json_annotation/json_annotation.dart';

part 'article_list_model.g.dart';

@JsonSerializable()
class ArticleListModel {
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
  final ArticleListFormatted? formatted;

  ArticleListModel({
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

  factory ArticleListModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleListModelToJson(this);
}

@JsonSerializable()
class ArticleListFormatted {
  final String? minAmount;
  final String? currentAmount;
  final String? totalAmount;
  final String? percent;
  final String? roi;
  final String? startDate;
  final String? endDate;
  final String? tenorDay;

  ArticleListFormatted({
    this.minAmount,
    this.currentAmount,
    this.endDate,
    this.percent,
    this.roi,
    this.startDate,
    this.tenorDay,
    this.totalAmount,
  });

  factory ArticleListFormatted.fromJson(Map<String, dynamic> json) =>
      _$ArticleListFormattedFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleListFormattedToJson(this);
}
