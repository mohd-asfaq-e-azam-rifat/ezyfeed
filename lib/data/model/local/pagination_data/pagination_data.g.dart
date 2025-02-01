// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationData _$PaginationDataFromJson(Map<String, dynamic> json) =>
    PaginationData(
      lastId: (json['last_id'] as num?)?.toInt(),
      isLastPage: json['package_name'] as bool?,
    );

Map<String, dynamic> _$PaginationDataToJson(PaginationData instance) =>
    <String, dynamic>{
      'last_id': instance.lastId,
      'package_name': instance.isLastPage,
    };
