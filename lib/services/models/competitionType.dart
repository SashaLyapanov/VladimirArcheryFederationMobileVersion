import 'package:json_annotation/json_annotation.dart';

part 'competitionType.g.dart';

@JsonSerializable()
class CompetitionType {
  const CompetitionType({
    required this.id,
    required this.name,
  });

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'name')
  final String name;

  factory CompetitionType.fromJson(Map<String, dynamic> json) => _$CompetitionTypeFromJson(json);

  Map<String, dynamic> toJson() => _$CompetitionTypeToJson(this);

  @override
  List<Object> get props => [
    id,
    name,
  ];
}