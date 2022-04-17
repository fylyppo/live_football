import 'package:equatable/equatable.dart';

class League extends Equatable {
  final LeagueData league;
  final Country country;
  
  const League({
    required this.league,
    required this.country,
  });

  @override
  List<Object?> get props => [league, country];
}

class LeagueData extends Equatable {
  final int id;
  final String name;
  final String type;
  final String logo;
  
  const LeagueData({
    required this.id,
    required this.name,
    required this.type,
    required this.logo,
  });

  @override
  List<Object?> get props => [id, name, type, logo];
}

class Country extends Equatable {
  final String name;
  final String code;
  final String flag;
  
  const Country({
    required this.name,
    required this.code,
    required this.flag,
  });

  @override
  List<Object?> get props => [name, code, flag];
}
