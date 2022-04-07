import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/specific_fixture/presentation/blocs/fixture_bloc/fixture_bloc.dart';
import 'features/specific_fixture/presentation/blocs/fixture_events_bloc/fixture_events_bloc.dart';
import 'features/specific_fixture/presentation/blocs/fixture_lineups_bloc/fixture_lineups_bloc.dart';
import 'features/specific_fixture/presentation/blocs/fixture_stats_bloc/fixture_stats_bloc.dart';
import 'features/specific_fixture/presentation/pages/fixture/fixture_page.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'LiveMatches',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(brightness: Brightness.dark),
            appBarTheme: const AppBarTheme(backgroundColor: Colors.green)),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => serviceLocator<FixtureEventsBloc>(),),
            BlocProvider(create: (context) => serviceLocator<FixtureBloc>(),),
            BlocProvider(create: (context) => serviceLocator<FixtureStatsBloc>(),),
            BlocProvider(create: (context) => serviceLocator<FixtureLineupsBloc>(),)
          ],
          child: const LiveMatchesPage(),
        ));
  }
}
