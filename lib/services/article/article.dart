import 'package:learn_brinvestyuk/helpers/store_management.dart';
import 'package:learn_brinvestyuk/services/api.dart';

class Article {
  String _baseUrl = Api().baseUrl;
  String? _token = StorageManagement().token;
}