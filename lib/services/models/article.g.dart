// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      id: json['id'] as String,
      name: json['name'] as String,
      link: json['link'] as String,
      body: json['body'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      fileName: json['fileName'] as String,
      fileData: json['fileData'] as String,
    )..imageList = json['imageList'] == null
        ? null
        : ImageByServer.fromJson(json['imageList'] as Map<String, dynamic>);

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'link': instance.link,
      'body': instance.body,
      'dateTime': instance.dateTime.toIso8601String(),
      'imageList': instance.imageList,
      'fileName': instance.fileName,
      'fileData': instance.fileData,
    };
