import 'package:json_annotation/json_annotation.dart';

// part 'statusOfCompetition.g.dart';

// @JsonSerializable()
// class StatusOfCompetition {
//   const StatusOfCompetition({
//     required this.name,
//   });
//
//   @JsonKey(name: 'name')
//   final String name;
//
//   factory StatusOfCompetition.fromJson(Map<String, dynamic> json) => _$StatusOfCompetitionFromJson(json);
//
//   Map<String, dynamic> toJson() => _$StatusOfCompetitionToJson(this);
//
//   @override
//   List<Object> get props => [
//   name,
//   ];
// }

enum StatusOfCompetition {
  FUTURE,
  PRESENT,
  PAST,
  CANCELLED
}
