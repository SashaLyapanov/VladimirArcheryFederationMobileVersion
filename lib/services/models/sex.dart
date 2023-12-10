import 'package:json_annotation/json_annotation.dart';

part 'sex.g.dart';

@JsonSerializable()
class Sex {
  const Sex({
    required this.id,
    required this.name,
  });

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;

  factory Sex.fromJson(Map<String, dynamic> json) => _$SexFromJson(json);

  Map<String, dynamic> toJson() => _$SexToJson(this);

  @override
  List<Object> get props => [
    id,
    name,
  ];
}