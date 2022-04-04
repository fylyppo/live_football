import 'package:flutter/material.dart';
import '../../../../../bloc/fixture_lineups_bloc/fixture_lineups_bloc.dart';

class PlayersTile extends StatelessWidget {
  final Loaded state;
  final bool isStarting;
  const PlayersTile({
    Key? key,
    required this.state,
    required this.isStarting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            PlayersTileListWidget(
              state: state,
              isHome: true,
              isStarting: isStarting,
            ),
            PlayersTileListWidget(
              state: state,
              isHome: false,
              isStarting: isStarting,
            ),
          ],
        ),
      ),
    );
  }
}

class PlayersTileListWidget extends StatelessWidget {
  final Loaded state;
  final bool isHome;
  final bool isStarting;

  PlayersTileListWidget({
    Key? key,
    required this.state,
    required this.isHome,
    required this.isStarting,
  }) : super(key: key) {
    homePlayersList = isStarting
        ? state.lineups.homeLineup.startXI.playersList
        : state.lineups.homeLineup.substitutes.playersList;
    awayPlayersList = isStarting
        ? state.lineups.awayLineup.startXI.playersList
        : state.lineups.awayLineup.substitutes.playersList;
  }

  var homePlayersList;
  var awayPlayersList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: isHome ? homePlayersList.length : awayPlayersList.length,
          itemBuilder: (context, index) {
            List<Widget> playerData = [
              SizedBox(
                  width: 20,
                  child: Center(
                      child: Text(isHome
                          ? homePlayersList[index].number.toString()
                          : awayPlayersList[index].number.toString()))),
              const SizedBox(
                width: 10,
              ),
              Text(
                isHome
                    ? homePlayersList[index].name
                    : awayPlayersList[index].name,
              ),
            ];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment:
                    isHome ? MainAxisAlignment.start : MainAxisAlignment.end,
                children: isHome ? playerData : playerData.reversed.toList(),
              ),
            );
          }),
    );
  }
}