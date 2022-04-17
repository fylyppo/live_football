import 'package:auto_route/auto_route.dart';
import 'package:live_football/features/specific_fixture/presentation/pages/fixture/fixture_page.dart';
import '../../features/fixtures/presentation/pages/fixtures_page.dart';
import '../../features/leagues/presentation/pages/leagues_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: LeaguesPage,
      initial: true,
    ),
    AutoRoute(
      page: FixturesPage,
    ),
    AutoRoute(
      page: FixturePage
      ),
  ],
)
class $AppRouter {}
