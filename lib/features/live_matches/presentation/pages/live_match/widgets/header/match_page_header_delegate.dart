import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_football/features/live_matches/presentation/pages/live_match/widgets/header/match_page_header_widget.dart';
import 'package:live_football/features/live_matches/presentation/widgets/gradient_text.dart';
import 'package:live_football/features/live_matches/presentation/widgets/text_opacity.dart';
import '../../../../../domain/entities/live_matches.dart';
import '../../../../bloc/live_matches_bloc.dart';

class MatchPageHeaderDelegate implements SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Center(
      child: BlocBuilder<LiveMatchesBloc, LiveMatchesState>(
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
              liveMatches: state.liveMatches,
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


