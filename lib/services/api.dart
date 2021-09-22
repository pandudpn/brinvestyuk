import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_brinvestyuk/constant/variable.dart' as Const;

class Api {
  factory Api() => Api._internal();
  Api._internal();

  static String? _api;
  static Dio? _client;

  Future<void> init(String env) async {
    _api ??= env == Const.dev
        ? _api = "https://api-staging.brinvestyuk.com"
        : _api = "https://api.brinvestyuk.com";

    _client ??= Dio(
      BaseOptions(
        baseUrl: _api!,
        connectTimeout: 30000,
        receiveTimeout: 30000,
      ),
    );
  }

  String get baseUrl => _api!;

  static Future<Map<String, dynamic>?> postJson(
      String url, Map<String, dynamic>? data, Options? options) async {
    try {
      final Response<Map<String, dynamic>>? response =
          await _client?.post(url, data: data, options: options);

      return response?.data;
    } on DioError catch (e) {
      String? msg = Const.errGlobal;
      if (e.type == DioErrorType.response) {
        if (e.response != null) {
          msg = e.response?.data['status']['reason'] as String;
        }
      } else if (e.type == DioErrorType.connectTimeout) {
        msg = Const.errConnectionGlobal;
      }
      Fluttertoast.showToast(msg: msg);

      throw Exception(e);
    }
  }

  static Future<Map<String, dynamic>?> get(String url, Options? options) async {
    try {
      final Response<Map<String, dynamic>>? response =
          await _client?.get(url, options: options);

      return response?.data;
    } on DioError catch (e) {
      String? msg = Const.errGlobal;
      if (e.type == DioErrorType.response) {
        if (e.response != null) {
          msg = e.response?.data['status']['reason'] as String;
          print("""error 
              code: ${e.response?.data['status']['code']}, 
              message: ${e.response?.data['status']['message']}, 
              reason: ${e.response?.data['status']['reason']}""");
        }
      } else if (e.type == DioErrorType.connectTimeout) {
        msg = Const.errConnectionGlobal;
      }
      Fluttertoast.showToast(msg: msg);

      throw Exception(e);
    }
  }
}
