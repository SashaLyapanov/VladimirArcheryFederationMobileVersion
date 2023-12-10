// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sportsman.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sportsman _$SportsmanFromJson(Map<String, dynamic> json) => Sportsman(
      id: json['id'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      region: Region.fromJson(json['region'] as Map<String, dynamic>),
      firstName: json['firstName'] as String,
      surname: json['surname'] as String,
      patronymic: json['patronymic'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      sportsTitle:
          SportsTitle.fromJson(json['sportsTitle'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SportsmanToJson(Sportsman instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'region': instance.region,
      'firstName': instance.firstName,
      'surname': instance.surname,
      'patronymic': instance.patronymic,
      'birthDate': instance.birthDate.toIso8601String(),
      'sportsTitle': instance.sportsTitle,
    };
