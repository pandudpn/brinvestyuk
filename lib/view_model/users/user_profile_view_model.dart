import 'package:learn_brinvestyuk/models/users/profile.dart';

class UserProfileViewModel {
  UserProfileModel _userProfileModel;

  UserProfileViewModel({required UserProfileModel userProfileModel})
      : _userProfileModel = userProfileModel;

  int get id {
    return _userProfileModel.id;
  }

  String get name {
    return _userProfileModel.name ?? "Investor";
  }

  UserKycModel? get kyc {
    return _userProfileModel.kyc;
  }

  UserInvestmentModel? get userInvestment {
    return _userProfileModel.investment;
  }
}
