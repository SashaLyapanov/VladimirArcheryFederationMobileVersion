import 'package:archery_federation/services/abstract_sportsman_service.dart';
import 'package:archery_federation/services/models/models.dart';
import 'package:archery_federation/aJsons/constants.dart';
import 'package:dio/dio.dart';

class SportsmanService implements AbstractSportsmanService{
  SportsmanService({
    required this.dio,
  });
  String ip = Constants.ip;
  final Dio dio;

  @override
  Future<List<Sportsman>> getSportsmanListByCompetitionAndBowType(String competitionId, String bowTypeName) async {
    final response = await dio.get('http://$ip:8080/api/v1/sportsman/sportsmenByCompetitionAndBowType?id=' + competitionId + '&bowTypeName='+bowTypeName);

    List<Sportsman> sportsmen = (response.data as List).map((e) => Sportsman.fromJson(e)).toList();
    return sportsmen;
  }
  
  
  Future<String> registrateInCompetition(String sportsmanId, String competitionId, String bowTypeId) async {
    final response = await dio.post('http://$ip:8080/api/v1/sportsman/regInCompetition?sportsmanId=' + sportsmanId + '&competitionId=' + competitionId, data: {
      "payment": false,
      "bowType": {
        "id": bowTypeId
      }
    });

    return response.data;
  }
}