import 'package:archery_federation/services/abstract_article_service.dart';
import 'package:archery_federation/services/models/models.dart';
import 'package:archery_federation/aJsons/constants.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class ArticleService implements AbstractArticleService{
  ArticleService({
    required this.dio,
  });
  String ip = Constants.ip;
  final Dio dio;

  @override
  Future<List<Article>> getAllArticles() async {

    final response = await dio.get('http://$ip:8080/api/v1/general/getArticles');

    List<Article> article = (response.data as List).map((e) => Article.fromJson(e)).toList();
    convertByteArray(article);
    return article;
  }

  convertByteArray(List<Article> articles) {
    for(int i = 0; i < articles.length; i++) {
      String str = articles[i].fileData.substring(1, articles[i].fileData.length-1);
      articles[i].fileData1 = str.split(',').map(int.parse).toList();
    }
  }

  @override
  Future<int?> createArticle(String name, String body, XFile imageFile) async {
    dio.options.headers['content-type'] = 'application/x-www-form-urlencoded';

    FormData formData = FormData.fromMap({
      "name": name,
      "body": body,
    });

    // for(int i = 1; i < imageFiles.length+1; i++) {
      formData.files.add(MapEntry(
        'file1',
        MultipartFile.fromFileSync(imageFile.path, filename: 'image2.jpg'),
      ));
    // }

    final response = await dio.post('http://$ip:8080/api/v1/admin/createArticle',
                                    data: formData,
                                    options: Options(
                                      contentType: 'multipart/form-data',
                                      headers: {
                                        'cache-control': 'no-cache',
                                        'processData': false,
                                        'contentType': false,
                                        'mimeType': 'multipart/form-data'
                                      }
                                    ));

    // Article article = Article.fromJson(response.data);
    return response.statusCode;
  }


}