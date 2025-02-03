// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppInfoImpl _$$AppInfoImplFromJson(Map<String, dynamic> json) =>
    _$AppInfoImpl(
      appName: json['app_name'] as String?,
      packageName: json['package_name'] as String?,
      appFlavor: $enumDecodeNullable(_$AppFlavorEnumMap, json['app_flavor']),
      buildType: $enumDecodeNullable(_$BuildTypeEnumMap, json['build_type']),
      baseUrl: json['base_url'] as String?,
      deviceModel: json['device_model'] as String?,
      deviceId: json['device_id'] as String?,
      manufacturer: json['manufacturer'] as String?,
      userAgent: json['user_agent'] as String?,
      versionName: json['version_name'] as String?,
      versionCode: json['version_code'] as String?,
      platform: $enumDecodeNullable(_$TargetPlatformEnumMap, json['platform']),
      platformVersion: json['platform_version'] as String?,
    );

Map<String, dynamic> _$$AppInfoImplToJson(_$AppInfoImpl instance) =>
    <String, dynamic>{
      'app_name': instance.appName,
      'package_name': instance.packageName,
      'app_flavor': _$AppFlavorEnumMap[instance.appFlavor],
      'build_type': _$BuildTypeEnumMap[instance.buildType],
      'base_url': instance.baseUrl,
      'device_model': instance.deviceModel,
      'device_id': instance.deviceId,
      'manufacturer': instance.manufacturer,
      'user_agent': instance.userAgent,
      'version_name': instance.versionName,
      'version_code': instance.versionCode,
      'platform': _$TargetPlatformEnumMap[instance.platform],
      'platform_version': instance.platformVersion,
    };

const _$AppFlavorEnumMap = {
  AppFlavor.development: 'dev',
  AppFlavor.production: 'prod',
};

const _$BuildTypeEnumMap = {
  BuildType.debug: 'debug',
  BuildType.release: 'release',
};

const _$TargetPlatformEnumMap = {
  TargetPlatform.android: 'android',
  TargetPlatform.fuchsia: 'fuchsia',
  TargetPlatform.iOS: 'iOS',
  TargetPlatform.linux: 'linux',
  TargetPlatform.macOS: 'macOS',
  TargetPlatform.windows: 'windows',
};
