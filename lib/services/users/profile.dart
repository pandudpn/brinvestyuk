import 'package:dio/dio.dart';
import 'package:learn_brinvestyuk/helpers/store_management.dart';
import 'package:learn_brinvestyuk/models/error_model.dart';
import 'package:learn_brinvestyuk/models/users/profile.dart';
import 'package:learn_brinvestyuk/services/api.dart';

class Users {
  String _baseUrl = Api().baseUrl;
  String? _token = StorageManagement().token;

  Future<UserProfileModel?> getProfileUser() async {
    Options options = Options(headers: {
      "Authorization": _token,
      "Content-Type": "application/json",
    });

    try {
      final Map<String, dynamic>? res = await Api.get('/users/me', options);

      return UserProfileModel.fromJson(res?["data"]);
    } on Exception catch (e) {
      print("error on user profile service " + e.toString());
      throw e;
    }
  }
}
