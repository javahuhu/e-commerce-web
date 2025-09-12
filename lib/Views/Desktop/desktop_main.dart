import 'dart:ui';
import 'package:ecommerce_admin/Core/Constants/constants.dart';
import 'package:ecommerce_admin/core/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hooks_riverpod/legacy.dart';

class DesktopMainScreen extends HookConsumerWidget {
  DesktopMainScreen({super.key});

  final List<Map<String, dynamic>> navbar = [
    {'Icons': Icons.dashboard_outlined},

    {'Icons': Icons.category_outlined},

    {'Icons': Icons.dashboard_outlined},

    {'Icons': Icons.dashboard_outlined},
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
      "name": "Samsung A53 Mobile",
      "category": "Electronics",
      "subCategory": "Mobile",
      "price": 15000.0,
    },
    {
      "image": "assets/sampleuser.jpg",
      "name": "iPhone 14 Pro",
      "category": "Electronics",
      "subCategory": "Mobile",
      "price": 5000.0,
    },
    {
      "image": "assets/sampleuser.jpg",
      "name": "iPhone 15 Pro",
      "category": "Electronics",
      "subCategory": "Mobile",
      "price": 20000.0,
    },
    {
      "image": "assets/sampleuser.jpg",
      "name": "S24 Ultra Mobile",
      "category": "Electronics",
      "subCategory": "Mobile",
      "price": 60000.0,
    },
    {
      "image": "assets/sampleuser.jpg",
      "name": "Apple Smart Watch",
      "category": "Electronics",
      "subCategory": "Gadgets",
      "price": 10000.0,
    },
  ];
  final isDark = StateProvider<bool>((ref) => false);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dark = ref.watch(isDark);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: -30,
            bottom: -60,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,

                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 150, 117, 250),
                    blurRadius: 100,
                    spreadRadius: 300,
                  ),
                ],
              ),
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
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
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

                    SizedBox(width: 25),
                    Text(
                      'Laza',
                      style: TextStyle(fontSize: 35, color: txtcolor),
                    ),

                    Expanded(
                      child: Center(
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
                                  dark ? Icons.dark_mode : Icons.light_mode,
                                  size: 19,
                                  color: dark ? txtcolor : Colors.amberAccent,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 92.5),
                    Row(
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
                            iconSize: 25,
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
                  ],
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 150),

                    child: Column(
                      children: [
                        SizedBox(
                          height: 550,
                          width: 160,
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.only(left: 35),
                            separatorBuilder: (_, _) => SizedBox(height: 15),
                            itemCount: navbar.length,
                            itemBuilder: (context, index) {
                              final icons = navbar[index];
                              return Container(
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

                                child: Icon(
                                  icons['Icons'],
                                  size: 30,
                                  color: txtcolor,
                                ),
                              );
                            },
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: 35),
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

                            child: Icon(
                              Icons.exit_to_app,
                              size: 30,
                              color: txtcolor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 10),
                            child: Text(
                              'Good morning, Mike',
                              style: TextStyle(fontSize: 50, color: txtcolor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 15),
                            child: Text(
                              "Let's make this day productive",
                              style: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(200, 50, 50, 50),
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 25,
                                  sigmaY: 25,
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: bgcolor.withValues(alpha: 0.8),
                                    border: Border.all(
                                      color: Colors.white.withValues(
                                        alpha: 0.7,
                                      ),
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
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 30,
                                        ),
                                        child: SizedBox(
                                          width: 965,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "My Products",
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
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                ),

                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Icon(
                                                      Icons.add,
                                                      color: Colors.black,
                                                      size: 25,
                                                    ),

                                                    Text(
                                                      "Add New",
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Color.fromARGB(
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

                                              SizedBox(width: 20),
                                              Icon(
                                                Icons.refresh,
                                                color: Colors.black,
                                                size: 25,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      SizedBox(
                                        width: 965,
                                        child: GridView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: myproducts.length,
                                          gridDelegate:
                                              SliverGridDelegateWithMaxCrossAxisExtent(
                                                maxCrossAxisExtent: 250,
                                                mainAxisSpacing: 20,
                                                crossAxisSpacing: 20,
                                                childAspectRatio: 2.5 / 2,
                                              ),
                                          itemBuilder: (context, index) {
                                            final val = myproducts[index];
                                            return Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),

                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 5,
                                                        ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(3),
                                                          alignment:
                                                              Alignment.center,
                                                          decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  3,
                                                                ),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .black12,
                                                                blurRadius: 2,
                                                              ),
                                                            ],
                                                          ),

                                                          child: Icon(
                                                            val["Icons"],
                                                            size: 30,
                                                          ),
                                                        ),

                                                        IconButton(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          constraints:
                                                              BoxConstraints(),
                                                          onPressed: () {},
                                                          icon: Icon(
                                                            Icons.more_vert,
                                                            size: 35,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  SizedBox(height: 10),

                                                  Text(
                                                    val["text"],
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: txtcolor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),

                                                  SizedBox(height: 10),
                                                  LinearProgressIndicator(
                                                    value: 0.5,
                                                    backgroundColor:
                                                        Colors.grey[300],
                                                    minHeight: 8,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          50,
                                                        ),
                                                  ),

                                                  SizedBox(height: 10),

                                                  Text(
                                                    "2 Products",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: txtcolor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 25),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Container(
                              width: 1005,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: bgcolor.withValues(alpha: 0.8),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.7),
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
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Text(
                                        'All Product',
                                        style: TextStyle(
                                          color: txtcolor,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    width: double.infinity,
                                    child: DataTable(
                                      columnSpacing: 0,
                                      horizontalMargin: 20,
                                      dataRowMaxHeight: 60,
                                      headingRowHeight: 60,
                                      columns: [
                                        DataColumn(
                                          label: Text(
                                            'Product Name',
                                            style: TextStyle(
                                              color: txtcolor,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),

                                        DataColumn(
                                          label: Text(
                                            'Category',
                                            style: TextStyle(
                                              color: txtcolor,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),

                                        DataColumn(
                                          label: Text(
                                            'Sub Category',
                                            style: TextStyle(
                                              color: txtcolor,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),

                                        DataColumn(
                                          label: Text(
                                            'Price',
                                            style: TextStyle(
                                              color: txtcolor,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),

                                        DataColumn(
                                          label: Text(
                                            'Edit',
                                            style: TextStyle(
                                              color: txtcolor,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),

                                        DataColumn(
                                          label: Text(
                                            'Delete',
                                            style: TextStyle(
                                              color: txtcolor,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                      rows: products.asMap().entries.map((
                                        entry,
                                      ) {
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
                                                    value["name"],
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
                                                value['subCategory'],
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: txtcolor,
                                                ),
                                              ),
                                            ),

                                            DataCell(
                                              Text(
                                                value['price'].toString(),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: txtcolor,
                                                ),
                                              ),
                                            ),

                                            DataCell(
                                              Icon(
                                                Icons.edit,
                                                color: const Color.fromARGB(255, 255, 255, 255),
                                                size: 20,
                                              ),
                                            ),

                                            DataCell(
                                              Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                                size: 20,
                                              ),
                                            ),
                                          ],
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Column(children: [

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

double _myproducts(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth >= AppSizes.desktopWidth) {
    // desktop and bigger
    return 1010;
  } else if (screenWidth >= AppSizes.totablet &&
      screenWidth < AppSizes.desktopWidth) {
    // tablet range
    return 745;
  } else if (screenWidth < AppSizes.totablet) {
    // small tablet / mobile
    return 470;
  }

  return 0;
}
