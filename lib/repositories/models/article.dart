import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  const Article({
    required this.name,
    required this.imageUrl,
    required this.body,
  });

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'imageUrl')
  final String imageUrl;
  @JsonKey(name: 'body')
  final String body;

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);


  @override
  List<Object> get props => [
    name,
    imageUrl,
    body,
  ];

}