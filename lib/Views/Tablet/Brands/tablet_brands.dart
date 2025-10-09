import 'dart:ui';
import 'package:ecommerce_admin/Core/Constants/nav_bar_items.dart';
import 'package:ecommerce_admin/Router/navigation_page.dart';
import 'package:ecommerce_admin/core/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';

class TabletBrandsPage extends HookConsumerWidget {
  TabletBrandsPage({super.key});

 
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
  final thedrawer = StateProvider<bool>((ref) => false);

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
    final expandDrawer = ref.watch(thedrawer);
    double width = MediaQuery.of(context).size.width;
    double gridWidth = (width > 2265) ? 150 : 20;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _backgroundAnimation(controller, scaleAnimation, colorAnimation),
          _backdropFilter(),
          _mainContent(
            context,
            ref,
            dark,
            expandDrawer,
            gridWidth,
            controller,
            scaleAnimation,
            colorAnimation,
          ),
        ],
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
          right: -80,
          top: -80,
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Transform.scale(
                scale: scaleAnimation.value,
                child: Container(
                  height: 100,
                  width: 100,
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
          left: -70,
          bottom: -70,
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Transform.scale(
                scale: scaleAnimation.value,
                child: Container(
                  height: 100,
                  width: 100,
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
    bool expandDrawer,
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
              _sidebar(
                context,
                expandDrawer,
                ref,
                () => ref.read(thedrawer.notifier).state = !expandDrawer,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(height: 35),
                      _header(context, ref, dark),
                      _welcomeSection(context),
                      SizedBox(height: 25),
                      _allProductsSection(
                        context,
                        expandDrawer,
                        ref,
                        () =>
                            ref.read(thedrawer.notifier).state = !expandDrawer,
                      ),

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

  Widget _sidebar(
    BuildContext context,
    bool drawer,
    WidgetRef ref,
    VoidCallback toggleDrawer,
  ) {
    final width = MediaQuery.of(context).size.width;
    if (width > 850) {
      return _buildFullSideBar(context, ref);
    }
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 1000,
      width: drawer ? 160 : 115,
      child: Column(
        children: [
          GestureDetector(
            onTap: toggleDrawer,
            child: Transform.translate(
              offset: Offset(0, -15),
              child: ClipRRect(
                child: Image.asset(
                  'assets/analysis.png',
                  fit: BoxFit.contain,
                  height: 115,
                  width: 115,
                ),
              ),
            ),
          ),

          if (drawer)
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 35),
                  separatorBuilder: (_, _) => SizedBox(height: 30),
                  itemCount: navbar.length,
                  itemBuilder: (context, index) {
                    final icons = navbar[index];
                    return GestureDetector(
                      onTap: () {
                         NavigationPage.navigateTo(context, index);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color.fromARGB(255, 255, 255, 255),
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
            ),
        ],
      ),
    );
  }

  Widget _buildFullSideBar(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Transform.translate(
          offset: Offset(0, -15),
          child: ClipRRect(
            child: Image.asset(
              'assets/analysis.png',
              fit: BoxFit.contain,
              height: 115,
              width: 115,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 50),
          child: SizedBox(
            height: 700,
            width: 160,
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 35),
              separatorBuilder: (_, _) => SizedBox(height: 30),
              itemCount: navbar.length,
              itemBuilder: (context, index) {
                final icons = navbar[index];
                return GestureDetector(
                  onTap: () {
                     NavigationPage.navigateTo(context, index);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(255, 255, 255, 255),
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
        ),
      ],
    );
  }

  Widget _header(BuildContext context, WidgetRef ref, bool dark) {
    double adjustmode = MediaQuery.of(context).size.width;
    final adjust = (adjustmode < 810) ? 0 : 105;
    return Padding(
      padding: EdgeInsets.only(left: 40),
      child: Row(
        children: [
          Text('Laza', style: TextStyle(fontSize: 35, color: txtcolor)),
          Spacer(),
          _themeToggle(context, ref, dark),
          Spacer(),
          SizedBox(width: adjust.toDouble()),
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
          height: 50,
          width: 100,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: dark ? txtcolor : Colors.grey[300],
            borderRadius: BorderRadius.circular(50),
          ),
          child: AnimatedAlign(
            alignment: dark ? Alignment.centerLeft : Alignment.centerRight,
            duration: Duration(milliseconds: 300),
            child: Container(
              width: 40,
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
      padding: EdgeInsets.only(right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              iconSize: 20,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 10),
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
                height: 45,
                width: 45,
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
                padding: const EdgeInsets.only(top: 20, left: 40),
                child: Text(
                  'Brands',
                  style: TextStyle(
                    fontSize: 50,
                    color: txtcolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 45),
                child: Text(
                  "Different Brands of Products",
                  style: TextStyle(
                    fontSize: 25,
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

  Widget _allProductsSection(
    BuildContext context,
    bool drawer,
    ref,
    VoidCallback toggleDrawer,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 40),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            constraints: BoxConstraints(minHeight: 200),
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
                          "All Brands",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: txtcolor,
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.add, color: Colors.black, size: 25),
                              Text(
                                "Add New",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(200, 50, 50, 50),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Icon(Icons.refresh, color: Colors.black, size: 25),
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
