import 'package:archery_federation/services/models/models.dart';

abstract class AbstractGeneralService {
  Future<List<Region>> getRegionList();
  Future<List<Sex>> getSexList();
  Future<List<SportsTitle>> getSportsTitleList();
  Future<List<BowType>> getAllBowTypeByCompetition(String competitionId);
}