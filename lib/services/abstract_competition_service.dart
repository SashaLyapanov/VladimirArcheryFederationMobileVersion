import 'package:archery_federation/services/models/models.dart';

abstract class AbstractCompetitionService {
  Future<List<Competition>> getCompetitionList();
  Future<Competition> getCompetition(String competitionName);
}