// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ListScreen(),
      );
    },
    LogicRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LogicScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    TempRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TempScreen(),
      );
    },
  };
}

/// generated route for
/// [ListScreen]
class ListRoute extends PageRouteInfo<void> {
  const ListRoute({List<PageRouteInfo>? children})
      : super(
          ListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LogicScreen]
class LogicRoute extends PageRouteInfo<void> {
  const LogicRoute({List<PageRouteInfo>? children})
      : super(
          LogicRoute.name,
          initialChildren: children,
        );

  static const String name = 'LogicRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TempScreen]
class TempRoute extends PageRouteInfo<void> {
  const TempRoute({List<PageRouteInfo>? children})
      : super(
          TempRoute.name,
          initialChildren: children,
        );

  static const String name = 'TempRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
