// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Competition _$CompetitionFromJson(Map<String, dynamic> json) => Competition(
      id: json['id'] as String,
      name: json['name'] as String,
      place: json['place'] as String,
      type: CompetitionType.fromJson(json['type'] as Map<String, dynamic>),
      price: json['price'] as int,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: DateTime.parse(json['date'] as String),
      status: $enumDecode(_$StatusOfCompetitionEnumMap, json['status']),
      bowTypeList: (json['bowTypeList'] as List<dynamic>)
          .map((e) => BowType.fromJson(e as Map<String, dynamic>))
          .toList(),
      mainJudge: json['mainJudge'] as String,
      secretary: json['secretary'] as String,
      zamJudge: json['zamJudge'] as String,
      judges: json['judges'] as String,
    );

Map<String, dynamic> _$CompetitionToJson(Competition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'place': instance.place,
      'type': instance.type,
      'price': instance.price,
      'categories': instance.categories,
      'date': instance.date.toIso8601String(),
      'status': _$StatusOfCompetitionEnumMap[instance.status]!,
      'bowTypeList': instance.bowTypeList,
      'mainJudge': instance.mainJudge,
      'secretary': instance.secretary,
      'zamJudge': instance.zamJudge,
      'judges': instance.judges,
    };

const _$StatusOfCompetitionEnumMap = {
  StatusOfCompetition.FUTURE: 'FUTURE',
  StatusOfCompetition.PRESENT: 'PRESENT',
  StatusOfCompetition.PAST: 'PAST',
  StatusOfCompetition.CANCELLED: 'CANCELLED',
};
