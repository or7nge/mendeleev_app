import 'package:auto_route/auto_route.dart';
import 'package:mendeleev_app/features/list/view/list_screen.dart';
import 'package:mendeleev_app/features/logic_test/view/logic_screen.dart';
import 'package:mendeleev_app/features/profile/view/profile_screen.dart';
import 'package:mendeleev_app/features/temp/temp.dart';

part 'app_router.gr.dart';


@AutoRouterConfig()
class AppRouter extends _$AppRouter {

 @override
 List<AutoRoute> get routes => [
   AutoRoute(
    page: TempRoute.page, 
    initial: true,
    children: [
      AutoRoute(page: ListRoute.page),
      AutoRoute(page: LogicRoute.page),
      AutoRoute(page: ProfileRoute.page),
    ]
  ),
 ];
}