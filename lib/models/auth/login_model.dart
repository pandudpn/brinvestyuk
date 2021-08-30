import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  final String accessToken;
  final String tokenType;

  LoginModel({required this.accessToken, required this.tokenType});

  @override
  String toString() {
    return 'LoginModel{accessToken: $accessToken, tokenType: $tokenType}';
  }

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
