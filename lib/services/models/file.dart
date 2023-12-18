import 'package:json_annotation/json_annotation.dart';

part 'file.g.dart';

@JsonSerializable()
class File {
  const File({
    required this.fileName,
    required this.fileData
  });

  @JsonKey(name: 'fileName')
  final String fileName;
  @JsonKey(name: 'fileData')
  final List<int> fileData;

  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);

  Map<String, dynamic> toJson() => _$FileToJson(this);


  @override
  List<Object> get props => [
    fileName,
    fileData
  ];

}