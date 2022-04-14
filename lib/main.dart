import 'package:flutter/material.dart';
import 'core/routing/app_router.gr.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'LiveMatches',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(brightness: Brightness.dark),
          appBarTheme: const AppBarTheme(backgroundColor: Colors.green)),
          routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
