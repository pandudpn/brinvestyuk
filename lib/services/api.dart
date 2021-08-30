import 'package:dio/dio.dart';
import 'package:learn_brinvestyuk/constant/variable.dart' as Const;
import 'package:learn_brinvestyuk/models/error_model.dart';

class Api {
  static String? _api;
  static Dio? _client;

  factory Api() => Api._internal();

  Api._internal();

  Future<void> init(String env) async {
    _api ??= env == Const.dev
        ? _api = "https://api-staging.brinvestyuk.com"
        : _api = "https://api.brinvestyuk.com";

    _client ??= new Dio();
  }

  String get baseUrl => _api!;

  static dynamic postJson(String url, Map? data, Options? options) async {
    try {
      final response = await _client?.post(url, data: data, options: options);

      return response?.data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        return ErrorModel.fromJson(e.response?.data["status"]);
      }

      throw Exception(e);
    }
  }

  static dynamic get(String url, Options? options) async {
    try {
      final response = await _client?.get(url, options: options);

      return response?.data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        return ErrorModel.fromJson(e.response?.data["status"]);
      }

      throw Exception(e);
    }
  }
}
