import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'competition.g.dart';

@JsonSerializable()
class Competition {
  Competition({
    required this.id,
    required this.name,
    required this.place,
    required this.type,
    required this.price,
    required this.categories,
    required this.date,
    required this.status,
    required this.bowTypeList,
    required this.mainJudge,
    required this.secretary,
    required this.zamJudge,
    required this.judges,
  });

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'place')
  final String place;
  @JsonKey(name: 'type')
  final CompetitionType type;
  @JsonKey(name: 'price')
  final int price;
  @JsonKey(name: 'categories')
  final List<Category> categories;
  @JsonKey(name: 'date')
  final DateTime date;
  @JsonKey(name: 'status')
  final StatusOfCompetition status;
  @JsonKey(name: 'bowTypeList')
  final List<BowType> bowTypeList;
  @JsonKey(name: 'mainJudge')
  final String mainJudge;
  @JsonKey(name: 'secretary')
  final String secretary;
  @JsonKey(name: 'zamJudge')
  final String zamJudge;
  @JsonKey(name: 'judges')
  final String judges;

  factory Competition.fromJson(Map<String, dynamic> json) => _$CompetitionFromJson(json);

  Map<String, dynamic> toJson() => _$CompetitionToJson(this);


  @override
  List<Object> get props => [
    id,
    name,
    place,
    type,
    status,
    price,
    categories,
    date,
    bowTypeList,
    mainJudge,
    secretary,
    zamJudge,
    judges,
  ];
}