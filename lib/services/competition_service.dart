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

}