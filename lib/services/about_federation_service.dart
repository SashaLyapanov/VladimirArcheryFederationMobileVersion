import 'package:archery_federation/services/models/models.dart';
import 'package:archery_federation/aJsons/constants.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import 'abstract_about_federation_service.dart';

class AboutFederationService implements AbstractAboutFederationService {
  AboutFederationService({
    required this.dio,
  });
  String ip = Constants.ip;
  final Dio dio;

  @override
  Future<List<AboutFederation>> getAllAboutFederation() async {

    final response = await dio.get('http://$ip:8080/api/v1/general/getAboutFederation');

    List<AboutFederation> aboutFederation = (response.data as List).map((e) => AboutFederation.fromJson(e)).toList();
    convertByteArray(aboutFederation);
    return aboutFederation;
  }

  convertByteArray(List<AboutFederation> aboutFederationList) {
    for(int i = 0; i < aboutFederationList.length; i++) {
      String str1 = aboutFederationList[i].fileRegulationData.substring(1, aboutFederationList[i].fileRegulationData.length-1);
      aboutFederationList[i].fileDataForRegulation = str1.split(',').map(int.parse).toList();

      String str2 = aboutFederationList[i].fileHistoryData.substring(1, aboutFederationList[i].fileHistoryData.length-1);
      aboutFederationList[i].fileDataForHistory = str2.split(',').map(int.parse).toList();
    }
  }

  // @override
  // Future<int?> createArticle(String name, String body, XFile imageFile) async {
  //   dio.options.headers['content-type'] = 'application/x-www-form-urlencoded';
  //
  //   FormData formData = FormData.fromMap({
  //     "name": name,
  //     "body": body,
  //   });
  //
  //   // for(int i = 1; i < imageFiles.length+1; i++) {
  //   formData.files.add(MapEntry(
  //     'file1',
  //     MultipartFile.fromFileSync(imageFile.path, filename: 'image2.jpg'),
  //   ));
  //   // }
  //
  //   final response = await dio.post('http://$ip:8080/api/v1/admin/createArticle',
  //       data: formData,
  //       options: Options(
  //           contentType: 'multipart/form-data',
  //           headers: {
  //             'cache-control': 'no-cache',
  //             'processData': false,
  //             'contentType': false,
  //             'mimeType': 'multipart/form-data'
  //           }
  //       ));
  //
  //   // Article article = Article.fromJson(response.data);
  //   return response.statusCode;
  // }


}