import 'package:archery_federation/services/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  const User({
    required this.id,
    required this.email,
    required this.role,
  required this.name,
  required this.surname,
  required this.patronymic,
  required this.birthDate,
});

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'role')
  final Role role;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'surname')
  final String surname;
  @JsonKey(name: 'patronymic')
  final String patronymic;
  @JsonKey(name: 'birthDate')
  final DateTime birthDate;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);


  @override
  List<Object> get props => [
    id,
    email,
    role,
    name,
    surname,
    patronymic,
    birthDate
  ];
}