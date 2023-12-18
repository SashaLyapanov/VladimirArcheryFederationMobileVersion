import 'package:archery_federation/services/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  Article({
    required this.id,
    required this.name,
    required this.link,
    required this.body,
    required this.dateTime,
    // required this.imageList,
    required this.fileName,
    required this.fileData
  });

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'link')
  final String link;
  @JsonKey(name: 'body')
  final String body;
  @JsonKey(name: 'dateTime')
  final DateTime dateTime;
  @JsonKey(name: 'imageList')
  ImageByServer? imageList;
  @JsonKey(name: 'fileName')
  final String fileName;
  @JsonKey(name: 'fileData')
  final String fileData;

  List<int>? fileData1;
  // @JsonKey(name: 'file')
  // final File file;

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);


  @override
  List<Object> get props => [
    id,
    name,
    link,
    body,
    dateTime,
    // imageList,
    fileName,
    fileData
  ];

}
