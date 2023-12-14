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
  Future<List<Category>> getAllCategories() async {
    final response  = await dio.get('http://$ip:8080/api/v1/general/allCategories');

    List<Category> categories = (response.data as List).map((e) => Category.fromJson(e)).toList();
    return categories;
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

  @override
  Future<List<BowType>> getAllBowTypeByCompetition(String competitionId) async {
    final response = await dio.get('http://$ip:8080/api/v1/general/allBowTypesByCompetition?competitionId=' + competitionId);

    List<BowType> bowTypeList = (response.data as List).map((e) => BowType.fromJson(e)).toList();
    return bowTypeList;
  }

  @override
  Future<List<BowType>> getAllBowTypes() async {
    final response = await dio.get('http://$ip:8080/api/v1/general/allBowTypes');

    List<BowType> bowTypeList = (response.data as List).map((e) => BowType.fromJson(e)).toList();
    return bowTypeList;
  }

  @override
  Future<List<CompetitionType>> getAllCompetitionTypes() async {
    final response = await dio.get('http://$ip:8080/api/v1/general/allCompetitionTypes');

    List<CompetitionType> competitionTypes = (response.data as List).map((e) => CompetitionType.fromJson(e)).toList();
    return competitionTypes;
  }

  // @override
  // Future<List<Sportsman>> getSportsmanListByCompetitionAndBowType(String competitionId, String bowTypeName) async {
  //   final response = await dio.get('http://$ip:8080/api/v1/sportsman/sportsmenByCompetitionAndBowType?id=' + competitionId + '&bowTypeName='+bowTypeName);
  //
  //   List<Sportsman> sportsmen = (response.data as List).map((e) => Sportsman.fromJson(e)).toList();
  //   return sportsmen;
  // }
}