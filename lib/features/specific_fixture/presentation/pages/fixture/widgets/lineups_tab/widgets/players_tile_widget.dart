import 'package:flutter/material.dart';
import '../../../../../blocs/fixture_lineups_bloc/fixture_lineups_bloc.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
        ? state.lineups[0].startXI
        : state.lineups[0].substitutes;
    awayPlayersList = isStarting
        ? state.lineups[1].startXI
        : state.lineups[1].substitutes;
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
              Flexible(
                child: Text(
                  isHome
                      ? homePlayersList[index].name
                      : awayPlayersList[index].name,
                      textAlign: isHome ? TextAlign.start : TextAlign.end,
                ),
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