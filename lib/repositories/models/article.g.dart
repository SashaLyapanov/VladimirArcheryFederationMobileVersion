// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'body': instance.body,
    };
