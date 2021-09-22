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
      final UserProfileModel? response = await Users().getProfileUser();
      if (response != null) {
        this.user = UserProfileViewModel(userProfileModel: response);
      }

      notifyListeners();
    } catch (e) {
      this.user = null;
    }
  }
}
