import 'package:json_annotation/json_annotation.dart';

part 'region.g.dart';

@JsonSerializable()
class Region {
  const Region({
    required this.id,
    required this.name,
  });

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);

  Map<String, dynamic> toJson() => _$RegionToJson(this);

  @override
  List<Object> get props => [
    id,
    name,
  ];
}