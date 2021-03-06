import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../blocs/fixture_stats_bloc/fixture_stats_bloc.dart';
import '../lineups_tab/lineups_tab.dart';

class StatsTab extends StatelessWidget {
  final int id;
  
  const StatsTab({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FixtureStatsBloc, FixtureStatsState>(
      builder: (context, state) {
        if (state is Empty) {
          context.read<FixtureStatsBloc>().add(GetFixtureStatsForId(id));
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
                children: const [
                  SizedBox(
                    height: 50,
                  ),
                  TitleTabWidget(
                    title: 'Statistics',
                  ),
                  StatsTile(),
                  
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

class StatsTile extends StatelessWidget {
  const StatsTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black,
      ),
      child:
          const Padding(padding: EdgeInsets.all(8.0), child: StatsTileWidget()),
    );
  }
}

class StatsTileWidget extends StatelessWidget {
  const StatsTileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = context.read<FixtureStatsBloc>().state;
    if (state is Loaded) {
      return ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: state.stats[0].statistics.length,
          itemBuilder: (context, index) {
            bool passesPercentage = state.stats[0].statistics[index].type == 'Passes %';
            String homeVal = state.stats[0].statistics[index].value.toString();
            String awayVal = state.stats[1].statistics[index].value.toString();
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Column(
                children: [
                  Text(state.stats[0].statistics[index].type),
                  Row(
                    children: [
                      SizedBox(
                        width: 35,
                        child: Text(homeVal)),
                      Expanded(
                        child: SizedBox(
                          height: 10,
                          child: Row(
                            children: [
                              passesPercentage ?
                              Flexible(
                                child: Container(
                                color: Colors.white,
                                child: Row(
                                  children: [
                                    Flexible(
                                      flex: 100-_mapStringToInt(awayVal),
                                      child: Container(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Flexible(
                                      flex: _mapStringToInt(homeVal),
                                      child: Container(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),)
                                ) :
                              Flexible(
                                child: Container(
                                color: Colors.white,
                                child: Row(
                                  children: [
                                    Flexible(
                                      flex: _mapStringToInt(awayVal),
                                      child: Container(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Flexible(
                                      flex: _mapStringToInt(homeVal),
                                      child: Container(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),)
                                ),
                                passesPercentage ?
                                Flexible(
                                child: Container(
                                color: Colors.grey,
                                child: Row(
                                  children: [
                                    Flexible(
                                      flex: _mapStringToInt(awayVal),
                                      child: Container(
                                        color: Colors.blue,
                                      ),
                                    ),
                                    Flexible(
                                      flex: 100-_mapStringToInt(awayVal),
                                      child: Container(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),)) :
                                Flexible(
                                child: Container(
                                color: Colors.grey,
                                child: Row(
                                  children: [
                                    Flexible(
                                      flex: _mapStringToInt(awayVal),
                                      child: Container(
                                        color: Colors.blue,
                                      ),
                                    ),
                                    Flexible(
                                      flex: homeVal == '0' && awayVal != '1' ? 1 : _mapStringToInt(homeVal),
                                      child: Container(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 35,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(awayVal)))
                    ]
                  ),
                ],
              ),
            );
        },
      );
    }
    return Container();
  }

  int _mapStringToInt(String value) {
    if(value.endsWith('%') ){
      value = value.substring(0, value.length-1);
    }
    int parsedValue = int.parse(value);
    return parsedValue;
  }
}
