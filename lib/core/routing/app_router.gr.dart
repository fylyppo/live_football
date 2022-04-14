// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../features/fixtures/presentation/pages/fixtures_page.dart' as _i1;
import '../../features/specific_fixture/presentation/pages/fixture/fixture_page.dart'
    as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    FixturesRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.FixturesPage());
    },
    FixtureRoute.name: (routeData) {
      final args = routeData.argsAs<FixtureRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.FixturePage(key: args.key, id: args.id));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(FixturesRoute.name, path: '/'),
        _i3.RouteConfig(FixtureRoute.name, path: '/fixture-page')
      ];
}

/// generated route for
/// [_i1.FixturesPage]
class FixturesRoute extends _i3.PageRouteInfo<void> {
  const FixturesRoute() : super(FixturesRoute.name, path: '/');

  static const String name = 'FixturesRoute';
}

/// generated route for
/// [_i2.FixturePage]
class FixtureRoute extends _i3.PageRouteInfo<FixtureRouteArgs> {
  FixtureRoute({_i4.Key? key, required int id})
      : super(FixtureRoute.name,
            path: '/fixture-page', args: FixtureRouteArgs(key: key, id: id));

  static const String name = 'FixtureRoute';
}

class FixtureRouteArgs {
  const FixtureRouteArgs({this.key, required this.id});

  final _i4.Key? key;

  final int id;

  @override
  String toString() {
    return 'FixtureRouteArgs{key: $key, id: $id}';
  }
}
