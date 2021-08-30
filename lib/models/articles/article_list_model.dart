import 'package:json_annotation/json_annotation.dart';

part 'article_list_model.g.dart';

@JsonSerializable()
class ArticleModel {
  final int? totalPerPage;
  final int? total;
  final int? prevPage;
  final int? currentPage;
  final int? nextPage;
  final ArticleListModel? articleLists;

  ArticleModel({
    this.totalPerPage,
    this.total,
    this.prevPage,
    this.currentPage,
    this.nextPage,
    this.articleLists,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}

@JsonSerializable()
class ArticleListModel {
  final int? id;
  final String? title;
  final String? body;
  final String? image;
  final String? status;
  final DateTime? createdAt;

  ArticleListModel({
    this.id,
    this.title,
    this.body,
    this.image,
    this.status,
    this.createdAt,
  });

  factory ArticleListModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleListModelToJson(this);
}

@JsonSerializable()
class ArticleAdmin {
  final int? id;
  final String? name;
  final String? email;

  ArticleAdmin({this.id, this.name, this.email});

  factory ArticleAdmin.fromJson(Map<String, dynamic> json) =>
      _$ArticleAdminFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleAdminToJson(this);
}
