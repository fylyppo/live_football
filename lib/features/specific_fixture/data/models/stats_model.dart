import 'package:live_football/features/specific_fixture/domain/entities/stats.dart';

class StatsModel extends Stats {
  const StatsModel({required StatsData homeStats, required StatsData awayStats}) : super(homeStats: homeStats, awayStats: awayStats);
  
  factory StatsModel.fromJson(List<dynamic> jsonList) {
    return StatsModel(homeStats: StatsData.fromJson(jsonList[0]), awayStats: StatsData.fromJson(jsonList[1]));
  }
}