import 'package:equatable/equatable.dart';

import 'package:live_football/features/specific_fixture/domain/entities/team.dart';

class Stats extends Equatable {
  final StatsData homeStats;
  final StatsData awayStats;
  
  const Stats({
    required this.homeStats,
    required this.awayStats,
  });

  factory Stats.fromJson(List<dynamic> jsonList) {
    return Stats(homeStats: StatsData.fromJson(jsonList[0]), awayStats: StatsData.fromJson(jsonList[1]));
  }

  @override
  List<Object?> get props => [homeStats, awayStats];
}

class StatsData extends Equatable {
  final Team team;
  final List stats;
  
  const StatsData({
    required this.team,
    required this.stats,
  });

  factory StatsData.fromJson(Map<String, dynamic> json) {
    List statistics = json['statistics'].map((e) => Stat.fromJson(e),).toList();
    return StatsData(team: Team.fromJson(json['team']), stats: statistics);
  }
  
  @override
  List<Object?> get props => [team, stats];
}

class Stat extends Equatable {
  final String type;
  final dynamic value;
  
  const Stat({
    required this.type,
    required this.value,
  });

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(type: json['type'], value: json['value']);
  }
  
  @override
  List<Object?> get props => [type, value];
}
