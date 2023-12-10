import 'package:archery_federation/services/models/models.dart';
import 'package:archery_federation/aJsons/constants.dart';
import 'package:dio/dio.dart';

import 'abstract_generalService.dart';

class GeneralService implements AbstractGeneralService{
  GeneralService({
    required this.dio,
  });
  String ip = Constants.ip;
  final Dio dio;

  @override
  Future<List<Region>> getRegionList() async {
    final response = await dio.get('http://$ip:8080/api/v1/general/allRegions');

    List<Region> regions = (response.data as List).map((e) => Region.fromJson(e)).toList();
    return regions;
  }

  @override
  Future<List<Sex>> getSexList() async {
    final response = await dio.get('http://$ip:8080/api/v1/general/allSex');

    List<Sex> sexList = (response.data as List).map((e) => Sex.fromJson(e)).toList();
    return sexList;
  }

  @override
  Future<List<SportsTitle>> getSportsTitleList() async {
    final response = await dio.get('http://$ip:8080/api/v1/general/allSportsTitle');

    List<SportsTitle> sportsTitleList = (response.data as List).map((e) => SportsTitle.fromJson(e)).toList();
    return sportsTitleList;
  }

  // @override
  // Future<List<Sportsman>> getSportsmanListByCompetitionAndBowType(String competitionId, String bowTypeName) async {
  //   final response = await dio.get('http://$ip:8080/api/v1/sportsman/sportsmenByCompetitionAndBowType?id=' + competitionId + '&bowTypeName='+bowTypeName);
  //
  //   List<Sportsman> sportsmen = (response.data as List).map((e) => Sportsman.fromJson(e)).toList();
  //   return sportsmen;
  // }
}