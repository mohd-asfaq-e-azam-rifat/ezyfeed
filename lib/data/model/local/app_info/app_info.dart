import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_info.freezed.dart';
part 'app_info.g.dart';

@unfreezed
class AppInfo with _$AppInfo {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  factory AppInfo({
    String? appName,
    String? packageName,
    AppFlavor? appFlavor,
    BuildType? buildType,
    String? baseUrl,
    String? deviceModel,
    String? deviceId,
    String? manufacturer,
    String? userAgent,
    String? versionName,
    String? versionCode,
    TargetPlatform? platform,
    String? platformVersion,
  }) = _AppInfo;

  const AppInfo._();

  factory AppInfo.fromJson(Map<String, Object?> json) =>
      _$AppInfoFromJson(json);

  bool isDebugBuild() {
    return buildType == BuildType.debug;
  }
}

enum AppFlavor {
  @JsonValue("dev")
  development("dev"),
  @JsonValue("prod")
  production("prod");

  const AppFlavor(this.value);

  final String value;
}

enum BuildType {
  @JsonValue("debug")
  debug,
  @JsonValue("release")
  release,
}
