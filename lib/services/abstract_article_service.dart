import 'package:archery_federation/services/models/models.dart';
import 'package:image_picker/image_picker.dart';

abstract class AbstractArticleService {
  Future<List<Article>>? getAllArticles();
  Future<int?> createArticle(String name, String body, XFile imageFile);
}