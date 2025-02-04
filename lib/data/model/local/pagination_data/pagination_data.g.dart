// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationDataImpl _$$PaginationDataImplFromJson(Map<String, dynamic> json) =>
    _$PaginationDataImpl(
      lastId: (json['last_id'] as num?)?.toInt(),
      isLastPage: json['is_last_page'] as bool?,
    );

Map<String, dynamic> _$$PaginationDataImplToJson(
        _$PaginationDataImpl instance) =>
    <String, dynamic>{
      'last_id': instance.lastId,
      'is_last_page': instance.isLastPage,
    };
