import 'package:json_annotation/json_annotation.dart';

part 'aboutFederation.g.dart';

@JsonSerializable()
class AboutFederation {
  AboutFederation({
    required this.id,
    required this.managers,
    required this.contacts,
    required this.linkForRegulation,
    required this.fileRegulationName,
    required this.fileRegulationData,
    required this.linkForHistory,
    required this.fileHistoryName,
    required this.fileHistoryData
  });

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'managers')
  final String managers;
  @JsonKey(name: 'contacts')
  final String contacts;
  @JsonKey(name: 'linkForRegulation')
  final String linkForRegulation;
  @JsonKey(name: 'fileRegulationName')
  final String fileRegulationName;
  @JsonKey(name: 'fileRegulationData')
  final String fileRegulationData;

  @JsonKey(name: 'linkForHistory')
  final String linkForHistory;
  @JsonKey(name: 'fileHistoryName')
  final String fileHistoryName;
  @JsonKey(name: 'fileHistoryData')
  final String fileHistoryData;

  List<int>? fileDataForRegulation;
  List<int>? fileDataForHistory;

  factory AboutFederation.fromJson(Map<String, dynamic> json) => _$AboutFederationFromJson(json);

  Map<String, dynamic> toJson() => _$AboutFederationToJson(this);


  @override
  List<Object> get props => [
    id,
    managers,
    contacts,
    linkForRegulation,
    fileRegulationName,
    fileRegulationData,
    linkForHistory,
    fileHistoryName,
    fileHistoryData
  ];

}
