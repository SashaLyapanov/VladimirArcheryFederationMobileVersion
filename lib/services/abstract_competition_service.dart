import 'package:archery_federation/services/models/models.dart';

abstract class AbstractCompetitionService {
  Future<List<Competition>> getCompetitionList();
  Future<Competition> getCompetition(String competitionName);
  Future<int> createCompetition(String name, String place, String date, String typeId, String price, List<Category> categoriesId, List<BowType> bowTypeListId, String mainJudge, String secretary, String zamJudge, String judges);
  Future<int> editCompetition(String competitionId, String name, String place, String date, String typeId, String price, List<Category> categoriesId, List<BowType> bowTypeListId, String mainJudge, String secretary, String zamJudge, String judges);
}