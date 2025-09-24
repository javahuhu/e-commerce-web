import 'dart:ui';
import 'package:ecommerce_admin/core/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';

class DesktopCategoriesPage extends HookConsumerWidget {
  DesktopCategoriesPage({super.key});

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

  final List<Map<String, dynamic>> myproducts = [
    {'Icons': Icons.production_quantity_limits, "text": 'All Products'},

    {'Icons': Icons.category_outlined, "text": 'Out of Stock'},

    {'Icons': Icons.production_quantity_limits, "text": 'Limited Stock'},

    {'Icons': Icons.production_quantity_limits, "text": 'Other Stock'},
  ];

  final List<Map<String, dynamic>> products = [
    {
      "image": "assets/sampleuser.jpg",
      "category": "Electronics",
      "Date": "2024",
      "Value": 0.5,
    },
    {
      "image": "assets/sampleuser.jpg",
      "category": "Books",
      "Date": "2024",
      "Value": 0.5,
    },
    {
      "image": "assets/sampleuser.jpg",
      "category": "Cloths",
      "Date": "2024",
      "Value": 0.5,
    },
    {
      "image": "assets/sampleuser.jpg",
      "category": "Grossory",
      "Date": "2024",
      "Value": 0.5,
    },
    {
      "image": "assets/sampleuser.jpg",
      "category": "Slippers",
      "Date": "2024",
      "Value": 0.5,
    },
    {
      "image": "assets/sampleuser.jpg",
      "category": "Top",
      "Date": "2024",
      "Value": 0.5,
    },
    {
      "image": "assets/sampleuser.jpg",
      "category": "Bottom",
      "Date": "2024",
      "Value": 0.5,
    },
  ];

  final isDark = StateProvider<bool>((ref) => false);
  final hover = StateProvider<int?>((ref) => null);
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
    final isHover = ref.watch(hover);
    double widthmode = MediaQuery.of(context).size.width;
    double modeWidth = (widthmode < 1800) ? 0 : 105;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
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
                          color:
                              colorAnimation.value ?? Colors.deepPurpleAccent,
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
                          color:
                              colorAnimation.value ?? Colors.deepPurpleAccent,
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

          BackdropFilter(
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
          ),

          Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
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
                              padding: EdgeInsets.only(left: 65),
                              separatorBuilder: (_, _) => SizedBox(height: 30),
                              itemCount: navbar.length,
                              itemBuilder: (context, index) {
                                final icons = navbar[index];
                                return Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    MouseRegion(
                                      onEnter: (_) =>
                                          ref.read(hover.notifier).state =
                                              index,
                                      onExit: (_) =>
                                          ref.read(hover.notifier).state = null,
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        onTap: () {
                                          switch (index) {
                                            case 0:
                                              context.push('/HomePage');
                                              break;
                                            case 1:
                                              context.go('/Categories');
                                          }
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: const Color.fromARGB(
                                              255,
                                              255,
                                              255,
                                              255,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black12,
                                                blurRadius: 2,
                                              ),
                                            ],
                                          ),

                                          child: ClipRRect(
                                            child: Image.asset(
                                              icons['Icons'],
                                              fit: BoxFit.contain,
                                              height: 31,
                                              width: 31,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            SizedBox(height: 35),
                            Padding(
                              padding: EdgeInsets.only(left: 40),
                              child: Row(
                                children: [
                                  Text(
                                    'Laza',
                                    style: TextStyle(
                                      fontSize: 35,
                                      color: txtcolor,
                                    ),
                                  ),

                                  Spacer(),

                                  Center(
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
                                          color: dark
                                              ? txtcolor
                                              : Colors.grey[300],
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                        ),

                                        child: AnimatedAlign(
                                          alignment: dark
                                              ? Alignment.centerLeft
                                              : Alignment.centerRight,
                                          duration: Duration(milliseconds: 300),
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),

                                            child: Icon(
                                              dark
                                                  ? Icons.dark_mode
                                                  : Icons.light_mode,
                                              size: 19,
                                              color: dark
                                                  ? txtcolor
                                                  : Colors.amberAccent,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Spacer(),
                                  SizedBox(width: modeWidth),
                                  Padding(
                                    padding: EdgeInsets.only(right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                            borderRadius: BorderRadius.circular(
                                              500,
                                            ),
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
                                  ),
                                ],
                              ),
                            ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 35),

                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 20,
                                          left: 40,
                                        ),
                                        child: Text(
                                          'Categories',
                                          style: TextStyle(
                                            fontSize: 50,
                                            color: txtcolor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 10,
                                          left: 45,
                                        ),
                                        child: Text(
                                          "Different Categories for Product",
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: Color.fromARGB(
                                              200,
                                              50,
                                              50,
                                              50,
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(height: 20),
                                      Padding(
                                        padding: EdgeInsets.only(left: 40),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 5,
                                              sigmaY: 5,
                                            ),

                                            child: Container(
                                              width: double.infinity,
                                              margin: EdgeInsets.only(
                                                right: 20,
                                              ),
                                              padding: EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                color: bgcolor.withValues(
                                                  alpha: 0.2,
                                                ),
                                                border: Border.all(
                                                  color: Colors.white
                                                      .withValues(alpha: 0.5),
                                                  width: 1.5,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withValues(
                                                          alpha: 0.05,
                                                        ),
                                                    blurRadius: 10,
                                                    offset: Offset(0, 4),
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),

                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 15,
                                                        ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'My Categories',
                                                          style: TextStyle(
                                                            color: txtcolor,
                                                            fontSize: 22,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),

                                                        Spacer(),

                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                10,
                                                              ),
                                                          decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  7,
                                                                ),
                                                          ),

                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .black,
                                                                size: 25,
                                                              ),

                                                              Text(
                                                                "Add New",
                                                                style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color:
                                                                      Color.fromARGB(
                                                                        200,
                                                                        50,
                                                                        50,
                                                                        50,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),

                                                        SizedBox(width: 50),
                                                        Icon(
                                                          Icons.refresh,
                                                          color: Colors.black,
                                                          size: 25,
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  SizedBox(
                                                    width: 1000,
                                                    child: Theme(
                                                      data: Theme.of(context).copyWith(
                                                        dividerColor:
                                                            Colors.transparent,
                                                        dividerTheme:
                                                            const DividerThemeData(
                                                              color: Colors
                                                                  .transparent,
                                                              space: 0,
                                                              thickness: 0,
                                                              indent: 0,
                                                              endIndent: 0,
                                                            ),
                                                      ),
                                                      child: DataTable(
                                                        dividerThickness: 0.0,
                                                        columnSpacing: 0,
                                                        horizontalMargin: 17,
                                                        dataRowMaxHeight: 60,
                                                        headingRowHeight: 60,
                                                        columns: [
                                                          DataColumn(
                                                            label: Text(
                                                              'Category Name',
                                                              style: TextStyle(
                                                                color: txtcolor,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),

                                                          DataColumn(
                                                            label: Text(
                                                              'Added Date',
                                                              style: TextStyle(
                                                                color: txtcolor,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),

                                                          DataColumn(
                                                            label: Text(
                                                              'Edit',
                                                              style: TextStyle(
                                                                color: txtcolor,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),

                                                          DataColumn(
                                                            label: Text(
                                                              'Delete',
                                                              style: TextStyle(
                                                                color: txtcolor,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                        rows: products.asMap().entries.map((
                                                          entry,
                                                        ) {
                                                          final value =
                                                              entry.value;
                                                          return DataRow(
                                                            cells: [
                                                              DataCell(
                                                                Row(
                                                                  children: [
                                                                    Image.asset(
                                                                      value['image'],
                                                                      width: 30,
                                                                      height:
                                                                          30,
                                                                    ),
                                                                    SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Text(
                                                                      value["category"],
                                                                      style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color:
                                                                            txtcolor,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),

                                                              DataCell(
                                                                Text(
                                                                  value['Date'],
                                                                  style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color:
                                                                        txtcolor,
                                                                  ),
                                                                ),
                                                              ),

                                                              DataCell(
                                                                Icon(
                                                                  Icons.edit,
                                                                  color:
                                                                      const Color.fromARGB(
                                                                        255,
                                                                        255,
                                                                        255,
                                                                        255,
                                                                      ),
                                                                  size: 20,
                                                                ),
                                                              ),

                                                              DataCell(
                                                                Icon(
                                                                  Icons.delete,
                                                                  color: Colors
                                                                      .red,
                                                                  size: 20,
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(height: 50),
                                    ],
                                  ),
                                ),

                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      right: 15,
                                      top: 192,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 5,
                                          sigmaY: 5,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.all(20),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: bgcolor.withValues(
                                              alpha: 0.2,
                                            ),
                                            border: Border.all(
                                              color: Colors.white.withValues(
                                                alpha: 0.5,
                                              ),
                                              width: 1.5,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withValues(
                                                  alpha: 0.05,
                                                ),
                                                blurRadius: 10,
                                                offset: Offset(0, 4),
                                              ),
                                            ],
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),

                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  left: 15,
                                                  top: 10,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    'Product Stock',
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      color: txtcolor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              SizedBox(height: 25),
                                              ListView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: products.length,
                                                itemBuilder: (context, index) {
                                                  final categories =
                                                      products[index];
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                      right: 13,
                                                      left: 13,
                                                    ),
                                                    child: Container(
                                                      padding: EdgeInsets.all(
                                                        5,
                                                      ),
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                            vertical: 10,
                                                          ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              10,
                                                            ),
                                                        color: Colors.white,
                                                      ),

                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons
                                                              .delivery_dining_outlined,
                                                          size: 25,
                                                        ),
                                                        title: Text(
                                                          categories['category'],
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            color: txtcolor,
                                                          ),
                                                          textScaler:
                                                              MediaQuery.of(
                                                                context,
                                                              ).textScaler,
                                                        ),
                                                        subtitle: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                top: 5,
                                                              ),
                                                          child: LinearProgressIndicator(
                                                            value:
                                                                (categories['Value']
                                                                        as num)
                                                                    .toDouble(),
                                                            backgroundColor:
                                                                Colors
                                                                    .grey[300],
                                                            minHeight: 8,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  50,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
          ),

          if (isHover != null) _buildToolTip(context, isHover),
        ],
      ),
    );
  }

  Widget _buildToolTip(BuildContext context, int index) {
    final label = navbar[index]['NavigateTo'];
    return Positioned(
      left: 150,
      top: 170 + (index * 80),
      child: TweenAnimationBuilder<double>(
        duration: Duration(milliseconds: 400),
        tween: Tween<double>(begin: 0, end: 1),
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset((1 - value) * 100, 0), // Slide from left
            child: Opacity(
              opacity: value, // Fade in
              child: child,
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.only(left: 10, top: 10, right: 28, bottom: 10),
          decoration: ShapeDecoration(
            color: Colors.black87,
            shape: TooltipShape(
              arrowWidth: 15,
              arrowHeight: 35,
              borderRadius: 5,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Sono',
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

class TooltipShape extends ShapeBorder {
  final double arrowWidth;
  final double arrowHeight;
  final double borderRadius;

  const TooltipShape({
    this.arrowWidth = 20.0,
    this.arrowHeight = 40.0,
    this.borderRadius = 12.0,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(left: 20);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final r = borderRadius;
    final aw = arrowWidth;
    final ah = arrowHeight;

    final bodyRRect = RRect.fromRectAndRadius(rect, Radius.circular(r));

    final triPath = Path()
      ..moveTo(rect.left - aw, rect.center.dy) // Arrow tip left
      ..lineTo(rect.left, rect.center.dy - ah / 2) // Top arrow base
      ..lineTo(rect.left, rect.center.dy + ah / 2) // Bottom arrow base
      ..close();

    final path = Path()
      ..addRRect(bodyRRect)
      ..addPath(triPath, Offset.zero);

    return path;
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // no manual paint needed, ShapeDecoration handles fill
  }

  @override
  ShapeBorder scale(double t) {
    return TooltipShape(
      arrowWidth: arrowWidth * t,
      arrowHeight: arrowHeight * t,
      borderRadius: borderRadius * t,
    );
  }
}
