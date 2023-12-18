// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

File _$FileFromJson(Map<String, dynamic> json) => File(
      fileName: json['fileName'] as String,
      fileData:
          (json['fileData'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$FileToJson(File instance) => <String, dynamic>{
      'fileName': instance.fileName,
      'fileData': instance.fileData,
    };
