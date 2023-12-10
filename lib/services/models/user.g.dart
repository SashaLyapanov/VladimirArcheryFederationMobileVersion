// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      email: json['email'] as String,
      role: $enumDecode(_$RoleEnumMap, json['role']),
      name: json['name'] as String,
      surname: json['surname'] as String,
      patronymic: json['patronymic'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'role': _$RoleEnumMap[instance.role]!,
      'name': instance.name,
      'surname': instance.surname,
      'patronymic': instance.patronymic,
      'birthDate': instance.birthDate.toIso8601String(),
    };

const _$RoleEnumMap = {
  Role.ADMIN: 'ADMIN',
  Role.SPORTSMAN: 'SPORTSMAN',
  Role.JUDGE: 'JUDGE',
};
