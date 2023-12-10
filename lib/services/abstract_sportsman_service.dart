import 'package:archery_federation/services/models/models.dart';

abstract class AbstractSportsmanService {
  Future<List<Sportsman>> getSportsmanListByCompetitionAndBowType(String competitionId, String bowTypeName);
  // Future<Sportsman> getCompetition(String competitionName);
}