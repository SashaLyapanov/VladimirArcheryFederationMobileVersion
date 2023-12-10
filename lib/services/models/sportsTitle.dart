import 'package:json_annotation/json_annotation.dart';

part 'sportsTitle.g.dart';

@JsonSerializable()
class SportsTitle {
  const SportsTitle({
    required this.id,
    required this.name,
  });

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;

  factory SportsTitle.fromJson(Map<String, dynamic> json) => _$SportsTitleFromJson(json);

  Map<String, dynamic> toJson() => _$SportsTitleToJson(this);

  @override
  List<Object> get props => [
    id,
    name,
  ];
}