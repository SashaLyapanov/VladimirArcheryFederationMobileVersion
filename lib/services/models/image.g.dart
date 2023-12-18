// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageByServer _$ImageByServerFromJson(Map<String, dynamic> json) =>
    ImageByServer(
      id: json['id'] as String,
      name: json['name'] as String,
      originalName: json['originalName'] as String,
      size: json['size'] as int,
      contentType: json['contentType'] as String,
      isPreviewImage: json['isPreviewImage'] as bool,
      bytes: json['bytes'] as List<dynamic>,
    );

Map<String, dynamic> _$ImageByServerToJson(ImageByServer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'originalName': instance.originalName,
      'size': instance.size,
      'contentType': instance.contentType,
      'isPreviewImage': instance.isPreviewImage,
      'bytes': instance.bytes,
    };
