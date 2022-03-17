import 'package:equatable/equatable.dart';

class LiveMatches extends Equatable {
  final List<Match> matches;

  const LiveMatches({required this.matches});

  @override
  List<Object?> get props => [matches];
}

class Match extends Equatable {
  final Fixture fixture;

  const Match({required this.fixture});

  @override
  List<Object?> get props => [fixture];
}

class Fixture extends Equatable{
  final int id;
  final String referee;

  const Fixture({required this.id, required this.referee});

  @override
  List<Object?> get props => [id, referee];
}