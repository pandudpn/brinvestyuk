import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class UserProfileModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "kyc")
  final UserKycModel? kyc;
  @JsonKey(name: "investment")
  final UserInvestmentModel? investment;

  UserProfileModel({
    required this.id,
    this.name,
    this.kyc,
    this.investment,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);
}

@JsonSerializable()
class UserKycModel {
  @JsonKey(name: "status")
  final String? status;

  UserKycModel({this.status});

  factory UserKycModel.fromJson(Map<String, dynamic> json) =>
      _$UserKycModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserKycModelToJson(this);
}

@JsonSerializable()
class UserInvestmentModel {
  @JsonKey(name: "total")
  final double total;
  @JsonKey(name: "profit")
  final double? profit;
  @JsonKey(name: "formatted")
  final UserInvestmentFormattedModel? formatted;

  UserInvestmentModel({required this.total, this.profit, this.formatted});

  factory UserInvestmentModel.fromJson(Map<String, dynamic> json) =>
      _$UserInvestmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInvestmentModelToJson(this);
}

@JsonSerializable()
class UserInvestmentFormattedModel {
  @JsonKey(name: "total")
  final String? total;
  @JsonKey(name: "profit")
  final String? profit;

  UserInvestmentFormattedModel({this.total, this.profit});

  factory UserInvestmentFormattedModel.fromJson(Map<String, dynamic> json) =>
      _$UserInvestmentFormattedModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInvestmentFormattedModelToJson(this);
}
