import 'package:json_annotation/json_annotation.dart';

part 'bowType.g.dart';

@JsonSerializable()
class BowType {
  const BowType({
    required this.id,
    required this.bowTypeName,
  });

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'bowTypeName')
  final String bowTypeName;

  factory BowType.fromJson(Map<String, dynamic> json) => _$BowTypeFromJson(json);

  Map<String, dynamic> toJson() => _$BowTypeToJson(this);

  @override
  List<String> get props => [
    id,
    bowTypeName,
  ];
}