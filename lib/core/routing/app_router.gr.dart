// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../features/fixtures/presentation/pages/fixtures_page.dart' as _i2;
import '../../features/leagues/presentation/pages/leagues_page.dart' as _i1;
import '../../features/specific_fixture/presentation/pages/fixture/fixture_page.dart'
    as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    LeaguesRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LeaguesPage());
    },
    FixturesRoute.name: (routeData) {
      final args = routeData.argsAs<FixturesRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.FixturesPage(
              key: args.key, id: args.id, leagueName: args.leagueName));
    },
    FixtureRoute.name: (routeData) {
      final args = routeData.argsAs<FixtureRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.FixturePage(key: args.key, id: args.id));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(LeaguesRoute.name, path: '/'),
        _i4.RouteConfig(FixturesRoute.name, path: '/fixtures-page'),
        _i4.RouteConfig(FixtureRoute.name, path: '/fixture-page')
      ];
}

/// generated route for
/// [_i1.LeaguesPage]
class LeaguesRoute extends _i4.PageRouteInfo<void> {
  const LeaguesRoute() : super(LeaguesRoute.name, path: '/');

  static const String name = 'LeaguesRoute';
}

/// generated route for
/// [_i2.FixturesPage]
class FixturesRoute extends _i4.PageRouteInfo<FixturesRouteArgs> {
  FixturesRoute({_i5.Key? key, required int id, required String leagueName})
      : super(FixturesRoute.name,
            path: '/fixtures-page',
            args: FixturesRouteArgs(key: key, id: id, leagueName: leagueName));

  static const String name = 'FixturesRoute';
}

class FixturesRouteArgs {
  const FixturesRouteArgs(
      {this.key, required this.id, required this.leagueName});

  final _i5.Key? key;

  final int id;

  final String leagueName;

  @override
  String toString() {
    return 'FixturesRouteArgs{key: $key, id: $id, leagueName: $leagueName}';
  }
}

/// generated route for
/// [_i3.FixturePage]
class FixtureRoute extends _i4.PageRouteInfo<FixtureRouteArgs> {
  FixtureRoute({_i5.Key? key, required int id})
      : super(FixtureRoute.name,
            path: '/fixture-page', args: FixtureRouteArgs(key: key, id: id));

  static const String name = 'FixtureRoute';
}

class FixtureRouteArgs {
  const FixtureRouteArgs({this.key, required this.id});

  final _i5.Key? key;

  final int id;

  @override
  String toString() {
    return 'FixtureRouteArgs{key: $key, id: $id}';
  }
}
