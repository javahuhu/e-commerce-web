import 'dart:ui';
import 'package:ecommerce_admin/core/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileBrandsPage extends HookConsumerWidget {
  MobileBrandsPage({super.key});

  final List<Map<String, dynamic>> navbar = [
    {'Icons': "assets/dashboard.png", 'NavigateTo': 'Dashboard'},

    {'Icons': "assets/dashboard.png", 'NavigateTo': 'Category'},

    {'Icons': "assets/dashboard.png", 'NavigateTo': 'SubCategory'},

    {'Icons': "assets/dashboard.png", 'NavigateTo': 'Brands'},

    {'Icons': "assets/dashboard.png", 'NavigateTo': 'Variant Type'},

    {'Icons': "assets/dashboard.png", 'NavigateTo': 'Orders'},

    {'Icons': "assets/dashboard.png", 'NavigateTo': 'Coupons'},

    {'Icons': "assets/dashboard.png", 'NavigateTo': 'Posters'},

    {'Icons': "assets/dashboard.png", 'NavigateTo': 'Notification'},
  ];

  final List<Map<String, dynamic>> products = [
    {
      "image": "assets/sampleuser.jpg",
      "subcategory": "Mobile",
      "category": "Electronics",
      "Date": "2024",
      "Value": 0.5,
    },
    {
      "image": "assets/sampleuser.jpg",
      "subcategory": "Mobile",
      "category": "Books",
      "Date": "2024",
      "Value": 0.5,
    },
    {
      "image": "assets/sampleuser.jpg",
      "subcategory": "Mobile",
      "category": "Cloths",
      "Date": "2024",
      "Value": 0.5,
    },
    {
      "image": "assets/sampleuser.jpg",
      "subcategory": "Mobile",
      "category": "Grossory",
      "Date": "2024",
      "Value": 0.5,
    },
    {
      "image": "assets/sampleuser.jpg",
      "subcategory": "Mobile",
      "category": "Slippers",
      "Date": "2024",
      "Value": 0.5,
    },
    {
      "image": "assets/sampleuser.jpg",
      "subcategory": "Mobile",
      "category": "Top",
      "Date": "2024",
      "Value": 0.5,
    },
    {
      "image": "assets/sampleuser.jpg",
      "subcategory": "Mobile",
      "category": "Bottom",
      "Date": "2024",
      "Value": 0.5,
    },
  ];

  final isDark = StateProvider<bool>((ref) => false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController(
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);

    final scaleAnimation = Tween<double>(
      begin: 0.7,
      end: 1.05,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    final colorAnimation = TweenSequence<Color?>([
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.blue, end: Colors.purple),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.purple, end: Colors.pink),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.pink, end: Colors.teal),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.teal, end: Colors.blue),
        weight: 1,
      ),
    ]).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    final dark = ref.watch(isDark);

    double width = MediaQuery.of(context).size.width;
    double gridWidth = (width > 2265) ? 150 : 20;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 240, 238, 238),
        elevation: 0,
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Transform.translate(
              offset: Offset(10, 0),
              child: ClipRRect(
                child: Image.asset(
                  'assets/analysis.png',
                  fit: BoxFit.contain,
                  height: 60.h,
                  width: 60.w,
                ),
              ),
            ),
          ),
        ),

        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 20.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(0, 245, 246, 248), // light gray
                    Color.fromARGB(0, 217, 219, 225), // lavender gray
                  ],
                ),
              ),
            ),
          ),
        ),
        title: _header(context, ref, dark),
      ),
      drawer: Container(
        padding: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
        width: 100.w,
        child: Drawer(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(181, 245, 246, 248),
                    Color.fromARGB(176, 217, 219, 225),
                  ],
                ),
              ),
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50.h),
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.only(left: 0.w),
                      separatorBuilder: (_, _) => SizedBox(height: 15.h),
                      itemCount: navbar.length,
                      itemBuilder: (context, index) {
                        final icons = navbar[index];
                        return GestureDetector(
                          onTap: () {
                            switch (index) {
                              case 0:
                                context.push('/HomePage');
                                break;
                              case 1:
                                context.go('/Categories');
                                break;
                              case 2:
                                context.go('/SubCategories');
                                break;
                              case 3:
                                context.go('/Brands');
                                break;
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 2),
                              ],
                            ),
                            child: ClipRRect(
                              child: Image.asset(
                                icons['Icons'],
                                fit: BoxFit.contain,
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 250.h),
                  _themeToggle(context, ref, dark),
                ],
              ),
            ),
          ),
        ),
      ),

      body: SafeArea(
        top: true,
        child: Stack(
          fit: StackFit.expand,

          children: [
            _backgroundAnimation(controller, scaleAnimation, colorAnimation),
            _backdropFilter(),
            _mainContent(
              context,
              ref,
              dark,
              gridWidth,
              controller,
              scaleAnimation,
              colorAnimation,
            ),
          ],
        ),
      ),
    );
  }

  Widget _backgroundAnimation(
    AnimationController controller,
    Animation<double> scaleAnimation,
    Animation<Color?> colorAnimation,
  ) {
    return Stack(
      children: [
        Positioned(
          right: -150.w,
          top: -80,
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Transform.scale(
                scale: scaleAnimation.value,
                child: Container(
                  height: 25.w,
                  width: 25.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: colorAnimation.value ?? Colors.deepPurpleAccent,
                        blurRadius: 100,
                        spreadRadius: 300,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          left: -150.w,
          bottom: -70,
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Transform.scale(
                scale: scaleAnimation.value,
                child: Container(
                  height: 25.w,
                  width: 25.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: colorAnimation.value ?? Colors.deepPurpleAccent,
                        blurRadius: 100,
                        spreadRadius: 300,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _backdropFilter() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(181, 245, 246, 248), // light gray
              Color.fromARGB(176, 217, 219, 225), // lavender gray
            ],
          ),
        ),
      ),
    );
  }

  Widget _mainContent(
    BuildContext context,
    WidgetRef ref,
    bool dark,
    double gridWidth,
    AnimationController controller,
    Animation<double> scaleAnimation,
    Animation<Color?> colorAnimation,
  ) {
    return Column(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      _welcomeSection(context),
                      SizedBox(height: 25),
                      _allProductsSection(context),
                      SizedBox(height: 25),

                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _header(BuildContext context, WidgetRef ref, bool dark) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Laza',
            style: TextStyle(fontSize: 20.sp, color: txtcolor),
          ),

          Spacer(),
          _headerIcons(),
        ],
      ),
    );
  }

  Widget _themeToggle(BuildContext context, WidgetRef ref, bool dark) {
    return Center(
      child: GestureDetector(
        onTap: () {
          ref.read(isDark.notifier).state = !dark;
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: 35.h,
          width: 80.w,
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: dark ? txtcolor : Colors.grey[300],
            borderRadius: BorderRadius.circular(50),
          ),
          child: AnimatedAlign(
            alignment: dark ? Alignment.centerLeft : Alignment.centerRight,
            duration: Duration(milliseconds: 300),
            child: Container(
              width: 35,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                dark ? Icons.dark_mode : Icons.light_mode,
                size: 19,
                color: dark ? txtcolor : Colors.amberAccent,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerIcons() {
    return Padding(
      padding: EdgeInsets.only(right: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 35.w,
            width: 35.w,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(Icons.search),
              iconSize: 15.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(500),
              child: Image.asset(
                'assets/sampleuser.jpg',
                fit: BoxFit.cover,
                height: 35.w,
                width: 35.w,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _welcomeSection(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 35),
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 24.w),
                child: Text(
                  'Brands',
                  style: TextStyle(
                    fontSize: 28.sp,
                    color: txtcolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 37),
                child: Text(
                  "Different Brands of Products",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Color.fromARGB(200, 50, 50, 50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _allProductsSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            width: double.infinity,

            margin: EdgeInsets.only(right: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: bgcolor.withValues(alpha: 0.2),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.5),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My Products",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: txtcolor,
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.add, color: Colors.black, size: 20.sp),
                              Text(
                                "Add New",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(200, 50, 50, 50),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Icon(Icons.refresh, color: Colors.black, size: 20.sp),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: 1000,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor: Colors.transparent,
                      dividerTheme: const DividerThemeData(
                        color: Colors.transparent,
                        space: 0,
                        thickness: 0,
                        indent: 0,
                        endIndent: 0,
                      ),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          dividerThickness: 0.0,
                          columnSpacing: 100,
                          horizontalMargin: 2,
                          dataRowMaxHeight: 60,
                          headingRowHeight: 60,
                          columns: [
                            DataColumn(
                              label: Text(
                                'Brand Name',
                                style: TextStyle(
                                  color: txtcolor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            DataColumn(
                              label: Text(
                                'Sub Category',
                                style: TextStyle(
                                  color: txtcolor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            DataColumn(
                              label: Text(
                                'Added Date',
                                style: TextStyle(
                                  color: txtcolor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            DataColumn(
                              label: SizedBox(
                                width: 42,
                                child: Center(
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(
                                      color: txtcolor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: SizedBox(
                                width: 42.5,
                                child: Center(
                                  child: Text(
                                    'Delete',
                                    style: TextStyle(
                                      color: txtcolor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                          rows: products.asMap().entries.map((entry) {
                            final value = entry.value;
                            return DataRow(
                              cells: [
                                DataCell(
                                  Row(
                                    children: [
                                      Image.asset(
                                        value['image'],
                                        width: 30,
                                        height: 30,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        value["subcategory"],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: txtcolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                DataCell(
                                  Text(
                                    value['category'],
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: txtcolor,
                                    ),
                                  ),
                                ),

                                DataCell(
                                  Text(
                                    value['Date'],
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: txtcolor,
                                    ),
                                  ),
                                ),

                                DataCell(
                                  SizedBox(
                                    width: 42,
                                    child: Center(
                                      child: Icon(
                                        Icons.edit,
                                        color: const Color.fromARGB(
                                          255,
                                          255,
                                          255,
                                          255,
                                        ),
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  SizedBox(
                                    width: 42.5, // Match the column width
                                    child: Center(
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
