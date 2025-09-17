import 'package:ecommerce_admin/Views/Desktop/Auth/desktop_main.dart';
import 'package:ecommerce_admin/Views/Desktop/Home/desktop_home_page.dart';
import 'package:ecommerce_admin/Views/Mobile/Auth/mobile_main.dart';
import 'package:ecommerce_admin/Views/Mobile/Home/mobile_home_page.dart';
import 'package:ecommerce_admin/Views/Tablet/Auth/tablet_main.dart';
import 'package:ecommerce_admin/Views/Tablet/Home/tablet_home_page.dart';
import 'package:ecommerce_admin/responsive_layout.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ResponsiveLayout(
        mobileBody: MobileMainScreen(),
        tabletBody: TabletMainScreen(),
        desktopBody: DesktopMainScreen(),
      ),
    ),

    GoRoute(
      path: '/HomePage',
      builder: (context, state) => ResponsiveLayout(
        mobileBody: MobileHomePage(),
        tabletBody: TabletHomePage(),
        desktopBody: DesktopHomePage(),
      ),
    ),
  ],
);
