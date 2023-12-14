import 'package:archery_federation/services/models/models.dart';

abstract class AbstractCompetitionService {
  Future<List<Competition>> getCompetitionList();
  Future<Competition> getCompetition(String competitionName);
  Future<Competition> createCompetition(String name, String place, String date, String typeId, List<Category> categoriesId, List<BowType> bowTypeListId, String mainJudge, String secretary, String zamJudge, String judges);
}