import 'package:json_annotation/json_annotation.dart';

part 'env_config.g.dart';

@JsonSerializable()
class EnvConfig extends Object {
  @JsonKey(name: 'env')
  String env;

  @JsonKey(name: 'debug')
  bool debug;

  EnvConfig(
    this.env,
    this.debug,
  );

  factory EnvConfig.fromJson(Map<String, dynamic> srcJson) =>
      _$EnvConfigFromJson(srcJson);

  Map<String, dynamic> toJson() => _$EnvConfigToJson(this);
}
