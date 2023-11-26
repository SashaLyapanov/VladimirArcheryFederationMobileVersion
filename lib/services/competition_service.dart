import 'package:archery_federation/services/abstract_competition_service.dart';
import 'package:archery_federation/services/models/models.dart';
import 'package:dio/dio.dart';

class CompetitionService implements AbstractCompetitionService{
  CompetitionService({
    required this.dio,
  });

  final Dio dio;
  // final Box<Competition> competitionBox;

  @override
  Future<List<Competition>> getCompetitionList() async {
    final response = await dio.get('http://192.168.1.46:8080/api/v1/general/competitions');

    List<Competition> competitionList = (response.data as List).map((e) => Competition.fromJson(e)).toList();
    return competitionList;
  }

  @override
  Future<Competition> getCompetition(String competitionName) async {
    final response = await dio.get('http://192.168.1.46:8080/api/v1/general/competitionByName?name=' + competitionName);

    Competition competition = Competition.fromJson(response.data);
    // Competition competition = response.data.map((e) => Competition.fromJson(e));
    return competition;
  }


}