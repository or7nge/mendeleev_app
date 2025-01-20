import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mendeleev_app/components/consts.dart';
import 'package:mendeleev_app/router/app_router.dart';

@RoutePage()
class TempScreen extends StatelessWidget {
  const TempScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    const navBarIcons = [
      'assets/home.svg',
      'assets/test.svg',
      'assets/profile.svg',
    ];
    return _TempBody(
      routes: const [
        ListRoute(),
        LogicRoute(),
        ProfileRoute(),
      ], 
      navBarItems: navBarIcons.map(
        (e) => BottomNavigationBarItem(
          icon: SvgPicture.asset(
            e,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            height: 37,
          ),
          // icon: Icon(e, size: 34),
          activeIcon: 
            SvgPicture.asset(
              e,
              colorFilter: const ColorFilter.mode(kGreen, BlendMode.srcIn),
              height: 37,
            ),
            // Icon(e, size: 34, color: const Color.fromARGB(255, 229, 255, 0)),
          
          label: '',
        ),
      )
      .toList(),
    );
  }
}

class _TempBody extends StatelessWidget {
  const _TempBody({
    super.key, 
    required this.routes, 
    required this.navBarItems
  }) : assert(routes.length == navBarItems.length);

  final List<PageRouteInfo<dynamic>> routes;
  final List<BottomNavigationBarItem> navBarItems;

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      lazyLoad: false,
      routes: routes,
      builder: (ctx, child) {
        final tabsRouter = AutoTabsRouter.of(ctx);

        return Scaffold(
          backgroundColor: Colors.transparent,
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            enableFeedback: false,
            backgroundColor: const Color.fromARGB(255, 24, 24, 24),
            items: navBarItems,
            currentIndex: tabsRouter.activeIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.indigo,
            unselectedItemColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            onTap: tabsRouter.setActiveIndex,
          ),
        );
      },
    );
  }
}