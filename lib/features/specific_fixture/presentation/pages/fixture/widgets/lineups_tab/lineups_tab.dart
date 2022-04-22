import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../blocs/fixture_lineups_bloc/fixture_lineups_bloc.dart';
import 'widgets/players_tile_widget.dart';

class LineupsTab extends StatelessWidget {
  final int id;

  const LineupsTab({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FixtureLineupsBloc, FixtureLineupsState>(
      builder: (context, state) {
        if (state is Empty) {
          context.read<FixtureLineupsBloc>().add(GetFixtureLineupsForId(id));
          return Container();
        } else if (state is Error) {
          return Text(state.message);
        } else if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is Loaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const TitleTabWidget(
                    title: 'Starting XI',
                  ),
                  PlayersTile(
                    state: state,
                    isStarting: true,
                  ),
                  const TitleTabWidget(
                    title: 'Substitutes',
                  ),
                  PlayersTile(state: state, isStarting: false),
                  const TitleTabWidget(
                    title: 'Coaches',
                  ),
                  CoachesTileWidget(
                    state: state,
                  ),
                  const SizedBox(
                    height: 90,
                    width: double.infinity,
                    child: Center(
                        child: Text(
                      'LIVE FOOTBALL',
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    )),
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}

class CoachesTileWidget extends StatelessWidget {
  final Loaded state;
  const CoachesTileWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            children: [
              Expanded(
                child: Text(state.lineups[0].coach.name),
              ),
              Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(state.lineups[1].coach.name)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleTabWidget extends StatelessWidget {
  final String title;
  const TitleTabWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
    );
  }
}
