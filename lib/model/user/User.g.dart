// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      address: json['address'] as String?,
      application: (json['application'] as List<dynamic>?)
          ?.map((e) => Application.fromJson(e as Map<String, dynamic>))
          .toList(),
      autelId: json['autelId'] as String?,
      avatar: json['avatar'] as String?,
      cc: json['cc'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      domain: json['domain'] as String?,
      email: json['email'] as String?,
      env: json['env'] as String?,
      iat: json['iat'] as int?,
      id: json['id'] as String?,
      isCountry: json['isCountry'] as String?,
      isNew: json['isNew'] as int?,
      loginFrom: json['loginFrom'] as String?,
      nbf: json['nbf'] as int?,
      needToComplete: json['needToComplete'] as bool?,
      needToRegister: json['needToRegister'] as bool?,
      nickname: json['nickname'] as String?,
      now: json['now'] as int?,
      phoneNumber: json['phoneNumber'] as String?,
      requiredCodeList: json['requiredCodeList'] as List<dynamic>?,
      roles: json['roles'] as String?,
      serverCode: json['serverCode'] as String?,
      sessionid: json['sessionid'] as String?,
      shopId: json['shopId'] as String?,
      source: json['source'] as String?,
      state: json['state'] as String?,
      token: json['token'] as String?,
      username: json['username'] as String?,
      workExperience: json['workExperience'] as String?,
      zip: json['zip'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'address': instance.address,
      'application': instance.application,
      'autelId': instance.autelId,
      'avatar': instance.avatar,
      'cc': instance.cc,
      'city': instance.city,
      'country': instance.country,
      'domain': instance.domain,
      'email': instance.email,
      'env': instance.env,
      'iat': instance.iat,
      'id': instance.id,
      'isCountry': instance.isCountry,
      'isNew': instance.isNew,
      'loginFrom': instance.loginFrom,
      'nbf': instance.nbf,
      'needToComplete': instance.needToComplete,
      'needToRegister': instance.needToRegister,
      'nickname': instance.nickname,
      'now': instance.now,
      'phoneNumber': instance.phoneNumber,
      'requiredCodeList': instance.requiredCodeList,
      'roles': instance.roles,
      'serverCode': instance.serverCode,
      'sessionid': instance.sessionid,
      'shopId': instance.shopId,
      'source': instance.source,
      'state': instance.state,
      'token': instance.token,
      'username': instance.username,
      'workExperience': instance.workExperience,
      'zip': instance.zip,
    };

_$_Application _$$_ApplicationFromJson(Map<String, dynamic> json) =>
    _$_Application(
      appCode: json['appCode'] as String?,
      applicationDomain: json['applicationDomain'] as String?,
    );

Map<String, dynamic> _$$_ApplicationToJson(_$_Application instance) =>
    <String, dynamic>{
      'appCode': instance.appCode,
      'applicationDomain': instance.applicationDomain,
    };
