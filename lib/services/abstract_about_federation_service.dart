import 'package:archery_federation/services/models/models.dart';
import 'package:image_picker/image_picker.dart';

abstract class AbstractAboutFederationService {
  Future<List<AboutFederation>>? getAllAboutFederation();
  // Future<int?> changeAboutFederation(String name, String body, XFile imageFile);
}