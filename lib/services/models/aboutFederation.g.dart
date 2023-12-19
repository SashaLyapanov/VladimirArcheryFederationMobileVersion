// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aboutFederation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutFederation _$AboutFederationFromJson(Map<String, dynamic> json) =>
    AboutFederation(
      id: json['id'] as String,
      managers: json['managers'] as String,
      contacts: json['contacts'] as String,
      linkForRegulation: json['linkForRegulation'] as String,
      fileRegulationName: json['fileRegulationName'] as String,
      fileRegulationData: json['fileRegulationData'] as String,
      linkForHistory: json['linkForHistory'] as String,
      fileHistoryName: json['fileHistoryName'] as String,
      fileHistoryData: json['fileHistoryData'] as String,
    )
      ..fileDataForRegulation =
          (json['fileDataForRegulation'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList()
      ..fileDataForHistory = (json['fileDataForHistory'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList();

Map<String, dynamic> _$AboutFederationToJson(AboutFederation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'managers': instance.managers,
      'contacts': instance.contacts,
      'linkForRegulation': instance.linkForRegulation,
      'fileRegulationName': instance.fileRegulationName,
      'fileRegulationData': instance.fileRegulationData,
      'linkForHistory': instance.linkForHistory,
      'fileHistoryName': instance.fileHistoryName,
      'fileHistoryData': instance.fileHistoryData,
      'fileDataForRegulation': instance.fileDataForRegulation,
      'fileDataForHistory': instance.fileDataForHistory,
    };
