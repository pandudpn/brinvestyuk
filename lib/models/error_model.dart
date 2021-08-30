import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  final String code;
  final String reason;

  ErrorModel({required this.code, required this.reason});

  @override
  String toString() {
    return "ErrorModel{code: $code, reason: $reason}";
  }

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}
