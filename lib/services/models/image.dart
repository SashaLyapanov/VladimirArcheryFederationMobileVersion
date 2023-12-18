import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class ImageByServer {
  const ImageByServer({
    required this.id,
    required this.name,
    required this.originalName,
    required this.size,
    required this.contentType,
    required this.isPreviewImage,
    required this.bytes
  });

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'originalName')
  final String originalName;
  @JsonKey(name: 'size')
  final int size;
  @JsonKey(name: 'contentType')
  final String contentType;
  @JsonKey(name: 'isPreviewImage')
  final bool isPreviewImage;
  @JsonKey(name: 'bytes')
  final List<dynamic> bytes;

  factory ImageByServer.fromJson(Map<String, dynamic> json) => _$ImageByServerFromJson(json);

  Map<String, dynamic> toJson() => _$ImageByServerToJson(this);


  @override
  List<Object> get props => [
    id,
    name,
    originalName,
    size,
    contentType,
    isPreviewImage,
    bytes
  ];

}