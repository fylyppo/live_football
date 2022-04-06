import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_football/features/specific_fixture/presentation/blocs/fixture_bloc/fixture_bloc.dart';
import 'package:live_football/features/specific_fixture/presentation/pages/fixture/widgets/lineups_tab/lineups_tab.dart';

import '../fixture/widgets/header/match_page_header_delegate.dart';
import 'widgets/details_tab/details_tab.dart';

class LiveMatchesPage extends StatefulWidget {
  const LiveMatchesPage({Key? key}) : super(key: key);

  @override
  State<LiveMatchesPage> createState() => _LiveMatchesPageState();
}

class _LiveMatchesPageState extends State<LiveMatchesPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    context.read<FixtureBloc>().add(const GetFixtureForId(850));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          physics: ClampingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                forceElevated: true,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => exit(0),
                ),
                title: BlocBuilder<FixtureBloc, FixtureState>(
                  builder: (context, state) {
                    if (state is Empty) {
                      return Container();
                    }
                    if (state is Loading) {
                      return const LinearProgressIndicator(
                        color: Colors.white,
                      );
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
          body: Builder(builder: (context) {
            return CustomScrollView(shrinkWrap: true, slivers: [
              SliverFillRemaining(
                child: TabBarView(
                  controller: controller,
                  children: [
                    DetailsTab(),
                    LineupsTab(),
                    Container(height: 100, child: Center(child: Text("Tab 1"))),
                  ],
                ),
              ),
            ]);
          }),
        ),

        // CustomScrollView(
        //   shrinkWrap: true,
        //   slivers: [
        //     SliverAppBar(
        //       leading: IconButton(
        //         icon: const Icon(Icons.arrow_back),
        //         onPressed: () => exit(0),
        //       ),
        //       actions: [
        //         IconButton(
        //           icon: const Icon(Icons.download),
        //           onPressed: () {
        //             context.read<FixtureBloc>().add(const GetFixtureForId(850));
        //           },
        //         ),
        //       ],
        //       title: BlocBuilder<FixtureBloc, FixtureState>(
        //         builder: (context, state) {
        //           if (state is Empty) {
        //             return Container();
        //           }
        //           if (state is Loading) {
        //             return const LinearProgressIndicator(
        //               color: Colors.white,
        //             );
        //           }
        //           if (state is Loaded) {
        //             return Row(
        //               children: [
        //                 Image.network(
        //                   state.fixture.league.logo,
        //                   height: 25,
        //                 ),
        //                 const SizedBox(
        //                   width: 10,
        //                 ),
        //                 Text(state.fixture.league.name),
        //               ],
        //             );
        //           }
        //           return Container();
        //         },
        //       ),
        //     ),
        //     SliverPersistentHeader(
        //       delegate: MatchPageHeaderDelegate(),
        //       pinned: true,
        //     ),
        //     SliverAppBar(
        //       forceElevated: true,
        //       toolbarHeight: 0,
        //       pinned: true,
        //       bottom: TabBar(
        //         tabs: const [
        //           Tab(text: 'Details'),
        //           Tab(text: 'Lineups'),
        //           Tab(text: 'Stats'),
        //         ],
        //         controller: controller,
        //       ),
        //     ),
        //   SliverFillRemaining(
        //     child: TabBarView(
        //       controller: controller,
        //       children: [
        //            Container(
        //              color: Colors.green,
        //              height: 100,
        //              child: Center(child: Text("Tab 1"))),
        //            LineupsTab(),
        //            Container(
        //              color: Colors.green,
        //              height: 100,
        //              child: Center(child: Text("Tab 1"))),
        //          ],
        //         ),
        //   ),
        //     // SliverList(
        //     //     delegate: SliverChildBuilderDelegate(
        //     //         (context, index) => Padding(
        //     //               padding: const EdgeInsets.all(0.0),
        //     //               child: Container(
        //     //                 height: 200,
        //     //                 color: Colors.black,
        //     //                 child: IconButton(
        //     //                   icon: const Icon(Icons.download),
        //     //                   onPressed: () {
        //     //                     context
        //     //                         .read<FixtureBloc>()
        //     //                         .add(const GetFixtureForId(850));
        //     //                   },
        //     //                 ),
        //     //               ),
        //     //             ),
        //     //         childCount: 8))
        //   ],
        // ),
      ),
    );
  }
}
