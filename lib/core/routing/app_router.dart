import 'package:auto_route/auto_route.dart';
import 'package:live_football/features/specific_fixture/presentation/pages/fixture/fixture_page.dart';
import '../../features/fixtures/presentation/pages/fixtures_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: FixturesPage,
      initial: true,
    ),
    AutoRoute(
      page: FixturePage
      ),
  ],
)
class $AppRouter {}
