import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_football/features/specific_fixture/presentation/bloc/fixture_bloc/fixture_bloc.dart';
import 'package:live_football/features/specific_fixture/presentation/pages/live_match/widgets/header/match_page_header_delegate.dart';

class LiveMatchesPage extends StatelessWidget {
  const LiveMatchesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => exit(0),
              ),
              title: BlocBuilder<FixtureBloc, FixtureState>(
                builder: (context, state) {
                  if(state is Empty){
                    return Container();
                  }
                  if(state is Loading){
                    return const LinearProgressIndicator(color: Colors.white,);
                  }
                  if(state is Loaded){
                    return Row(
                      children: [
                        Image.network(state.fixture.league.logo, height: 25,),
                        const SizedBox(width: 10,),
                        Text(state.fixture.league.name),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ),
            SliverPersistentHeader(delegate: MatchPageHeaderDelegate(), pinned: true,),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            height: 200,
                            color: Colors.black,
                            child: IconButton(icon: const Icon(Icons.download), onPressed: (){
                              context.read<FixtureBloc>().add(const GetFixtureForId(850));
                            },),
                          ),
                        ),
                    childCount: 10))
          ],
        ),
      ),
    );
  }
}
