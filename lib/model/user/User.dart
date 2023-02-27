// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'User.freezed.dart';
part 'User.g.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

@freezed
class User with _$User {
  const factory User({
    String? address,
    List<Application>? application,
    String? autelId,
    String? avatar,
    String? cc,
    String? city,
    String? country,
    String? domain,
    String? email,
    String? env,
    int? iat,
    String? id,
    String? isCountry,
    int? isNew,
    String? loginFrom,
    int? nbf,
    bool? needToComplete,
    bool? needToRegister,
    String? nickname,
    int? now,
    String? phoneNumber,
    List<dynamic>? requiredCodeList,
    String? roles,
    String? serverCode,
    String? sessionid,
    String? shopId,
    String? source,
    String? state,
    String? token,
    String? username,
    String? workExperience,
    String? zip,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Application with _$Application {
  const factory Application({
    String? appCode,
    String? applicationDomain,
  }) = _Application;

  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);
}
