import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/specific_fixture/presentation/bloc/fixture_bloc.dart';
import 'features/specific_fixture/presentation/pages/live_match/live_matches_page.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'LiveMatches',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(brightness: Brightness.dark),
          appBarTheme: const AppBarTheme(backgroundColor: Colors.green)
        ),
        home: BlocProvider(
          create: (context) => serviceLocator<FixtureBloc>(),
          child: const LiveMatchesPage(),
        ));
  }
}
