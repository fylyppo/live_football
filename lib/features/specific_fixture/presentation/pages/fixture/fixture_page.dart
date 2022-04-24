import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_football/features/specific_fixture/presentation/blocs/fixture_bloc/fixture_bloc.dart';
import 'package:live_football/features/specific_fixture/presentation/pages/fixture/widgets/lineups_tab/lineups_tab.dart';
import 'package:live_football/features/specific_fixture/presentation/pages/fixture/widgets/stats_tab/stats_tab.dart';
import 'package:live_football/injection_container.dart';
import '../../blocs/fixture_events_bloc/fixture_events_bloc.dart';
import '../../blocs/fixture_lineups_bloc/fixture_lineups_bloc.dart' hide Empty, Loading, Loaded;
import '../../blocs/fixture_stats_bloc/fixture_stats_bloc.dart' hide Empty, Loading, Loaded;
import '../fixture/widgets/header/match_page_header_delegate.dart';
import 'widgets/details_tab/details_tab.dart';

class FixturePage extends StatefulWidget implements AutoRouteWrapper {
  final int id;

  const FixturePage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<FixturePage> createState() => _FixturePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => serviceLocator<FixtureBloc>(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<FixtureEventsBloc>(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<FixtureLineupsBloc>(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<FixtureStatsBloc>(),
      ),
    ], child: this);
  }
}

class _FixturePageState extends State<FixturePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    context.read<FixtureBloc>().add(GetFixtureForId(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          physics: const ClampingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                forceElevated: true,
                title: BlocBuilder<FixtureBloc, FixtureState>(
                  builder: (context, state) {
                    if (state is Empty) {
                      return Container();
                    }
                    if (state is Loading) {
                      return Container();
                    }
                    if (state is Loaded) {
                      return Row(
                        children: [
                          Image.network(
                            state.fixture.league.logo,
                            height: 25,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(state.fixture.league.name),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              ),
              SliverPersistentHeader(
                delegate: MatchPageHeaderDelegate(),
                pinned: true,
              ),
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  toolbarHeight: 0,
                  pinned: true,
                  bottom: TabBar(
                    tabs: const [
                      Tab(text: 'Details'),
                      Tab(text: 'Lineups'),
                      Tab(text: 'Stats'),
                    ],
                    controller: controller,
                  ),
                ),
              )
            ];
          },
          body: TabBarView(
                  controller: controller,
                  children: [
                    DetailsTab(
                      id: widget.id,
                    ),
                    LineupsTab(
                      id: widget.id,
                    ),
                    StatsTab(
                      id: widget.id,
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
