import 'package:ecommerce_admin/Views/Desktop/Categories/desktop_categories.dart';
import 'package:ecommerce_admin/Views/Desktop/LogIn/desktop_main.dart';
import 'package:ecommerce_admin/Views/Desktop/Home/desktop_home_page.dart';
import 'package:ecommerce_admin/Views/Mobile/Categories/mobile_categories.dart';
import 'package:ecommerce_admin/Views/Mobile/LogIn/mobile_main.dart';
import 'package:ecommerce_admin/Views/Mobile/Home/mobile_home_page.dart';
import 'package:ecommerce_admin/Views/Tablet/Categories/tablet_categories.dart';
import 'package:ecommerce_admin/Views/Tablet/LogIn/tablet_main.dart';
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

      routes: []
    ),


    GoRoute(
      path: '/Categories',
      builder: (context, state) => ResponsiveLayout(
        mobileBody: MobileCategoriesPage(),
        tabletBody: TabletCategoriesPage(),
        desktopBody: DesktopCategoriesPage(),
      ),

      routes: []
    ),
  ],
);
