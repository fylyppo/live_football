import '../../domain/entities/lineups.dart';

class LineupsModel extends Lineups {
  const LineupsModel({required Lineup homeLineup, required Lineup awayLineup})
      : super(homeLineup: homeLineup, awayLineup: awayLineup);

      factory LineupsModel.fromJson(List<dynamic> jsonList) {
        return LineupsModel(homeLineup: Lineup.fromJson(jsonList[0]), awayLineup: Lineup.fromJson(jsonList[1]));
      }
}