import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'sportsman.g.dart';

@JsonSerializable()
class Sportsman {
  const Sportsman({
    required this.id,
    required this.email,
    required this.password,
    required this.region,
    required this.firstName,
    required this.surname,
    required this.patronymic,
    required this.birthDate,
    required this.sportsTitle,
  });

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'region')
  final Region region;
  @JsonKey(name: 'firstName')
  final String firstName;
  @JsonKey(name: 'surname')
  final String surname;
  @JsonKey(name: 'patronymic')
  final String patronymic;
  @JsonKey(name: 'birthDate')
  final DateTime birthDate;
  @JsonKey(name: 'sportsTitle')
  final SportsTitle sportsTitle;

  factory Sportsman.fromJson(Map<String, dynamic> json) => _$SportsmanFromJson(json);

  Map<String, dynamic> toJson() => _$SportsmanToJson(this);


  @override
  List<Object> get props => [
  id,
  email,
  password,
  region,
  firstName,
  surname,
  patronymic,
  birthDate,
  sportsTitle,
  ];

}