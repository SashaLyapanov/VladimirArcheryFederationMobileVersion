import 'package:archery_federation/services/models/models.dart';

abstract class AbstractGeneralService {
  Future<List<Region>> getRegionList();
  Future<List<Category>> getAllCategories();
  Future<List<Sex>> getSexList();
  Future<List<SportsTitle>> getSportsTitleList();
  Future<List<BowType>> getAllBowTypeByCompetition(String competitionId);
  Future<List<BowType>> getAllBowTypes();
  Future<List<CompetitionType>> getAllCompetitionTypes();
}