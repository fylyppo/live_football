import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/fixture_bloc/fixture_bloc.dart';
import 'match_page_header_widget.dart';

class MatchPageHeaderDelegate implements SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Center(
      child: BlocBuilder<FixtureBloc, FixtureState>(
        builder: (context, state) {
          if (state is Empty) {
            return const Text("It's nothing here.");
          } else if (state is Error) {
            return Text(state.message);
          } else if (state is Loading) {
            return Column(
              children: const [
                CircularProgressIndicator(),
                Text("Loading..."),
              ],
            );
          } else if (state is Loaded) {
            return MatchPageHeaderWidget(
              fixture: state.fixture,
              shrinkOffset: shrinkOffset,
            );
          }
          return Container();
        },
      ),
    );
  }

  @override
  double get maxExtent => 160;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      null;

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  TickerProvider? get vsync => null;
}


