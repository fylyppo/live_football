import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_football/features/live_matches/presentation/pages/live_match/live_matches_page.dart';
import 'features/live_matches/presentation/bloc/live_matches_bloc.dart';
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
          appBarTheme: AppBarTheme(backgroundColor: Colors.green)
        ),
        home: BlocProvider(
          create: (context) => serviceLocator<LiveMatchesBloc>(),
          child: LiveMatchesPage(),
        ));
  }
}
