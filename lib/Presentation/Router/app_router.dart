import 'package:ecommerce_admin/Presentation/Views/Desktop/Brands/desktop_brand.dart';
import 'package:ecommerce_admin/Presentation/Views/Desktop/Categories/desktop_categories.dart';
import 'package:ecommerce_admin/Presentation/Views/Desktop/LogIn/desktop_main.dart';
import 'package:ecommerce_admin/Presentation/Views/Desktop/Home/desktop_home_page.dart';
import 'package:ecommerce_admin/Presentation/Views/Desktop/SubCategories/desktop_sub_categories.dart';
import 'package:ecommerce_admin/Presentation/Views/Desktop/VariantType/desktop_variant_type.dart';
import 'package:ecommerce_admin/Presentation/Views/Mobile/Brands/mobile_brands.dart';
import 'package:ecommerce_admin/Presentation/Views/Mobile/Categories/mobile_categories.dart';
import 'package:ecommerce_admin/Presentation/Views/Mobile/LogIn/mobile_main.dart';
import 'package:ecommerce_admin/Presentation/Views/Mobile/Home/mobile_home_page.dart';
import 'package:ecommerce_admin/Presentation/Views/Mobile/SubCategories/mobile_sub_categories.dart';
import 'package:ecommerce_admin/Presentation/Views/Mobile/VariantType/mobile_variant_type.dart';
import 'package:ecommerce_admin/Presentation/Views/Tablet/Brands/tablet_brands.dart';
import 'package:ecommerce_admin/Presentation/Views/Tablet/Categories/tablet_categories.dart';
import 'package:ecommerce_admin/Presentation/Views/Tablet/LogIn/tablet_main.dart';
import 'package:ecommerce_admin/Presentation/Views/Tablet/Home/tablet_home_page.dart';
import 'package:ecommerce_admin/Presentation/Views/Tablet/SubCategories/tablet_sub_categories.dart';
import 'package:ecommerce_admin/Presentation/Views/Tablet/VariantType/tablet_variant_type.dart';
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

    GoRoute(
      path: '/Categories',
      builder: (context, state) => ResponsiveLayout(
        mobileBody: MobileCategoriesPage(),
        tabletBody: TabletCategoriesPage(),
        desktopBody: DesktopCategoriesPage(),
      ),

      
    ),

    GoRoute(
      path: '/SubCategories',
      builder: (context, state) => ResponsiveLayout(
        mobileBody: MobileSubCategoriesPage(),
        tabletBody: TabletSubCategoriesPage(),
        desktopBody: DesktopSubCategoriesPage(),
      ),

     
    ),

    GoRoute(
      path: '/Brands',
      builder: (context, state) => ResponsiveLayout(
        mobileBody: MobileBrandsPage(),
        tabletBody: TabletBrandsPage(),
        desktopBody: DesktopBrandPage(),
      ),

     
    ),

    GoRoute(
      path: '/VariantType',
      builder: (context, state) => ResponsiveLayout(
        mobileBody: MobileVariantTypePage(),
        tabletBody: TabletVariantTypePage(),
        desktopBody: DesktopVariantTypePage(),
      ),
    ),
  ],
);
