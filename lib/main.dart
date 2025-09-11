import 'package:ecommerce_admin/Views/Desktop/desktop_main.dart';
import 'package:ecommerce_admin/Views/Mobile/mobile_main.dart';
import 'package:ecommerce_admin/Views/Tablet/tablet_main.dart';
import 'package:ecommerce_admin/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ResponsiveLayout(
            mobileBody: MobileMainScreen(),
            tabletBody: TabletMainScreen(),
            desktopBody: DesktopMainScreen(),
          ),
        );
      },
    );
  }
}
