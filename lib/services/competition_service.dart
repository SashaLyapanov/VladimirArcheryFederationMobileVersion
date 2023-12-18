import 'package:archery_federation/services/abstract_competition_service.dart';
import 'package:archery_federation/services/models/models.dart';
import 'package:archery_federation/aJsons/constants.dart';
import 'package:dio/dio.dart';

class CompetitionService implements AbstractCompetitionService{
  CompetitionService({
    required this.dio,
  });
  String ip = Constants.ip;
  final Dio dio;

  @override
  Future<List<Competition>> getCompetitionList() async {
    final response = await dio.get('http://$ip:8080/api/v1/general/competitions');

    List<Competition> competitionList = (response.data as List).map((e) => Competition.fromJson(e)).toList();
    return competitionList;
  }

  @override
  Future<Competition> getCompetition(String competitionName) async {
    final response = await dio.get('http://$ip:8080/api/v1/general/competitionByName?name=' + competitionName);

    Competition competition = Competition.fromJson(response.data);
    // Competition competition = response.data.map((e) => Competition.fromJson(e));
    return competition;
  }
  
  @override
  Future<int> createCompetition(String name, String place, String date, String typeId, String price, List<Category> categoriesId, List<BowType> bowTypeListId, String mainJudge, String secretary, String zamJudge, String judges) async {
    List<Map<String, String>> categoriesData = [];
    List<Map<String, String>> bowTypesData = [];

    for (Category category in categoriesId) {
      categoriesData.add({
        "id": category.id
      });
    }

    for (BowType bowType in bowTypeListId) {
      bowTypesData.add({
        "id": bowType.id
      });
    }

    final response = await dio.post('http://$ip:8080/api/v1/admin/createCompetition', data: {
      "name": name,
      "place": place,
      "type": {
        "id": typeId
      },
      "price": price,
      "categories": categoriesData,
      "bowTypeList": bowTypesData,
      "mainJudge": mainJudge,
      "secretary": secretary,
      "zamJudge": zamJudge,
      "judges": judges,
      "date": date
    });

    // Competition competition = Competition.fromJson(response.data);
    int statusCode = response.statusCode!;
    return statusCode;
  }

  @override
  Future<int> editCompetition(String competitionId, String name, String place, String date, String typeId, String price, List<Category> categoriesId, List<BowType> bowTypeListId, String mainJudge, String secretary, String zamJudge, String judges) async {
    List<Map<String, String>> categoriesData = [];
    List<Map<String, String>> bowTypesData = [];
    int? returnStatement;

    for (Category category in categoriesId) {
      categoriesData.add({
        "id": category.id
      });
    }

    for (BowType bowType in bowTypeListId) {
      bowTypesData.add({
        "id": bowType.id
      });
    }

    final response = await dio.put('http://$ip:8080/api/v1/admin/editCompetition?id=' + competitionId, data: {
      "name": name,
      "place": place,
      "type": {
        "id": typeId
      },
      "price": price,
      "categories": categoriesData,
      "bowTypeList": bowTypesData,
      "mainJudge": mainJudge,
      "secretary": secretary,
      "zamJudge": zamJudge,
      "judges": judges,
      "date": date
    });

    // Competition competition = Competition.fromJson(response.data);
    // returnStatement = {response.statusCode!: Competition.fromJson(response.data)};
 //   return {response.statusCode!: Competition.fromJson(response.data)};
    returnStatement = response.statusCode;

    return returnStatement!;
  }



}