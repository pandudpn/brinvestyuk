import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_brinvestyuk/models/error_model.dart';
import 'package:learn_brinvestyuk/models/users/profile.dart';
import 'package:learn_brinvestyuk/services/users/profile.dart';
import 'package:learn_brinvestyuk/view_model/users/user_profile_view_model.dart';

class UserProfileListViewModel with ChangeNotifier {
  UserProfileViewModel? user;

  Future<void> getProfile() async {
    try {
      dynamic response = await Users().getProfileUser();
      if (response is ErrorModel) {
        this.user = null;
        print("error " + response.code + " reason is " + response.reason);
        Fluttertoast.showToast(msg: response.reason);
      } else if (response is UserProfileModel) {
        this.user = UserProfileViewModel(userProfileModel: response);
      }

      notifyListeners();
    } catch (e) {
      print(e);
      this.user = null;
      Fluttertoast.showToast(
          msg:
              "Terjadi kesalahan pada server, silahkan coba beberapa saat lagi");
    }
  }
}
