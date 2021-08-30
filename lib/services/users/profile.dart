import 'package:dio/dio.dart';
import 'package:learn_brinvestyuk/helpers/store_management.dart';
import 'package:learn_brinvestyuk/models/error_model.dart';
import 'package:learn_brinvestyuk/models/users/profile.dart';
import 'package:learn_brinvestyuk/services/api.dart';

class Users {
  String _baseUrl = Api().baseUrl;
  String? _token = StorageManagement().token;

  Future<dynamic> getProfileUser() async {
    Options options = Options(headers: {
      "Authorization": _token,
      "Content-Type": "application/json",
    });

    try {
      final res = await Api.get("$_baseUrl/users/me", options);

      if (res is ErrorModel) {
        return res;
      }
      return UserProfileModel.fromJson(res["data"]);
    } on Exception catch (e) {
      print("error on user profile service " + e.toString());
      throw e;
    }
  }
}
