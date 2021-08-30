import 'package:learn_brinvestyuk/models/articles/article_list_model.dart';

class ArticlesViewModel {
  ArticleModel? _articleModel;

  ArticlesViewModel({ArticleModel? article}) : _articleModel = article;

  int? get nextPage => _articleModel?.nextPage;

  int? get prevPage => _articleModel?.prevPage;

  List<ArticleListModel>? get articles => _articleModel?.articleLists;
}
