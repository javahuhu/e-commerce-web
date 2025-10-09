import 'dart:ui';
import 'package:ecommerce_admin/Core/Constants/nav_bar_items.dart';
import 'package:ecommerce_admin/Router/navigation_page.dart';
import 'package:ecommerce_admin/core/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:hooks_riverpod/legacy.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DesktopHomePage extends HookConsumerWidget {
  DesktopHomePage({super.key});

  final List<Map<String, dynamic>> upload = [
    {'icon': Icons.camera_alt_rounded, "label": 'Main Image'},
    {'icon': Icons.camera_alt_rounded, "label": 'Second Image'},
    {'icon': Icons.camera_alt_rounded, "label": 'Third Image'},
    {'icon': Icons.camera_alt_rounded, "label": 'Fourth Image'},
    {'icon': Icons.camera_alt_rounded, "label": 'Fifth Image'},
  ];

  final List<Map<String, dynamic>> category = [
    {
      "Select Brand": ["Apple", "Samsung", "Xiaomi"],
    },
    {
      "Select Category": ["Phone", "Tablet", "Laptop"],
    },

    {
      "Select Size": ["Small", "Medium", "Large"],
    },
  ];

  final selectedValue = StateProvider<Map<String, String?>>(
    (ref) => {
      "Select Brand": null,
      "Select Category": null,
      "Select Size": null,
    },
  );
  void _showAddNew(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return LayoutBuilder(
          builder: (context, contraints) {
            final width = MediaQuery.of(context).size.width;

            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (width < 1100 && context.mounted) {
                context.pop();
              }
            });

            return Consumer(
              builder: (context, ref, child) {
                final selected = ref.watch(selectedValue);
                return Dialog(
                  elevation: 5,
                  child: Container(
                    height: 700,
                    width: 1000,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 230, 233, 243),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            'ADD PRODUCT',
                            style: TextStyle(
                              fontFamily: 'Sono',
                              fontSize: 35,
                              color: txtcolor,
                            ),
                          ),
                        ),

                        SizedBox(height: 10),
                        GlassmorphicContainer(
                          width: double.infinity,
                          height: 595,
                          borderRadius: 20,
                          blur: 5,
                          border: 2,
                          linearGradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(
                                255,
                                255,
                                255,
                                255,
                              ).withValues(alpha: 0.1),
                              Color.fromARGB(
                                255,
                                255,
                                255,
                                255,
                              ).withValues(alpha: 0.1),
                            ],
                            stops: [0.1, 1],
                          ),
                          borderGradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(
                                255,
                                255,
                                255,
                                255,
                              ).withValues(alpha: 0.3),
                              Color.fromARGB(
                                255,
                                255,
                                255,
                                255,
                              ).withValues(alpha: 0.3),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 30),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: SizedBox(
                                  height: 150,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,

                                    separatorBuilder: (_, __) =>
                                        SizedBox(width: 37),
                                    itemCount: upload.length,
                                    itemBuilder: (context, index) {
                                      final val = upload[index];
                                      return GestureDetector(
                                        onTap: () {},
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: Container(
                                            width: 150,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                255,
                                                255,
                                                255,
                                                255,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),

                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ClipRRect(
                                                  child: Icon(
                                                    val['icon'],
                                                    size: 50,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(height: 15),
                                                Text(
                                                  val['label'],
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),

                              SizedBox(height: 15),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Product Name',
                                    filled: false,
                                    hintStyle: TextStyle(color: Colors.grey),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black54,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),

                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 15),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black54,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),

                                  child: TextField(
                                    scrollPhysics:
                                        AlwaysScrollableScrollPhysics(),
                                    textAlignVertical: TextAlignVertical.top,
                                    maxLines: null,
                                    expands: true,
                                    decoration: InputDecoration(
                                      hintText: 'Product Details',
                                      filled: false,
                                      hintStyle: TextStyle(color: Colors.grey),

                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 15),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: category.asMap().entries.map((
                                    entry,
                                  ) {
                                    final label = entry.value.keys.first;
                                    final options = List<String>.from(
                                      entry.value.values.first,
                                    );
                                    return DropdownButton2<String>(
                                      underline: SizedBox.shrink(),
                                      hint: Text(
                                        label,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      buttonStyleData: ButtonStyleData(
                                        height: 48,
                                        width: 270,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          border: Border.all(
                                            color: Colors.black54,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      dropdownStyleData: DropdownStyleData(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                      value: options.contains(selected[label])
                                          ? selected[label]
                                          : null,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: const Color.fromARGB(
                                          255,
                                          0,
                                          0,
                                          0,
                                        ),
                                      ),
                                      items: options.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        ref.read(selectedValue.notifier).state =
                                            {...selected, label: newValue};
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),

                              SizedBox(height: 15),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 270,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Price',
                                          filled: false,
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            borderSide: BorderSide(
                                              color: Colors.black54,
                                              width: 2,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            borderSide: BorderSide(
                                              color: Colors.black54,
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      width: 270,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Offer Price',
                                          filled: false,
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            borderSide: BorderSide(
                                              color: Colors.black54,
                                              width: 2,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            borderSide: BorderSide(
                                              color: Colors.black54,
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      width: 270,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Quantity',
                                          filled: false,
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            borderSide: BorderSide(
                                              color: Colors.black54,
                                              width: 2,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            borderSide: BorderSide(
                                              color: Colors.black54,
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 50),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        context.pop();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        splashFactory: NoSplash.splashFactory,
                                        shadowColor: Colors.transparent,
                                        elevation: 0,
                                        backgroundColor: const Color.fromARGB(
                                          255,
                                          240,
                                          124,
                                          124,
                                        ),
                                        foregroundColor: const Color.fromARGB(
                                          255,
                                          255,
                                          255,
                                          255,
                                        ),
                                        minimumSize: Size(250, 55),
                                      ),
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),

                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        splashFactory: NoSplash.splashFactory,
                                        shadowColor: Colors.transparent,
                                        elevation: 0,
                                        backgroundColor: const Color.fromARGB(
                                          255,
                                          128,
                                          196,
                                          130,
                                        ),
                                        foregroundColor: const Color.fromARGB(
                                          255,
                                          255,
                                          255,
                                          255,
                                        ),
                                        minimumSize: Size(250, 55),
                                      ),
                                      child: Text(
                                        'Save',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  

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
    double width = MediaQuery.of(context).size.width;
    double gridWidth = (width > 2265) ? 150 : 50;
    double widthmode = MediaQuery.of(context).size.width;
    double modeWidth = (widthmode < 1800) ? 0 : 157;
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
                                           NavigationPage.navigateTo(context, index);
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
                                              height: 30,
                                              width: 30,
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
                                          'Good morning, Mike',
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
                                          "Let's make this day productive",
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

                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 40,
                                          top: 20,
                                          bottom: 10,
                                        ),
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
                                              padding: EdgeInsets.all(20),
                                              margin: EdgeInsets.only(
                                                right: 20,
                                              ),
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
                                                        const EdgeInsets.only(
                                                          bottom: 30,
                                                        ),
                                                    child: SizedBox(
                                                      width: double.infinity,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "My Products",
                                                            style: TextStyle(
                                                              fontSize: 22,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: txtcolor,
                                                            ),
                                                          ),

                                                          Spacer(),

                                                          MouseRegion(
                                                            cursor:
                                                                SystemMouseCursors
                                                                    .click,
                                                            child: GestureDetector(
                                                              onTap: () {
                                                                _showAddNew(
                                                                  context,
                                                                  ref,
                                                                );
                                                              },
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets.all(
                                                                      10,
                                                                    ),
                                                                decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
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
                                                                        fontSize:
                                                                            18,
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

                                                  GridView.builder(
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemCount:
                                                        myproducts.length,
                                                    gridDelegate:
                                                        SliverGridDelegateWithMaxCrossAxisExtent(
                                                          maxCrossAxisExtent:
                                                              _myproducts(
                                                                context,
                                                              ),
                                                          mainAxisSpacing: 20,
                                                          crossAxisSpacing:
                                                              gridWidth,
                                                          childAspectRatio:
                                                              _myproductsAspectRatio(
                                                                context,
                                                              ),
                                                        ),
                                                    itemBuilder: (context, index) {
                                                      final val =
                                                          myproducts[index];
                                                      return Container(
                                                        padding: EdgeInsets.all(
                                                          10,
                                                        ),
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                15,
                                                              ),
                                                        ),

                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets.symmetric(
                                                                    horizontal:
                                                                        5,
                                                                  ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                          3,
                                                                        ),
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            3,
                                                                          ),
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color:
                                                                              Colors.black12,
                                                                          blurRadius:
                                                                              2,
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
                                                                        EdgeInsets
                                                                            .zero,
                                                                    constraints:
                                                                        BoxConstraints(),
                                                                    onPressed:
                                                                        () {},
                                                                    icon: Icon(
                                                                      Icons
                                                                          .more_vert,
                                                                      size: 35,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),

                                                            SizedBox(
                                                              height: 10,
                                                            ),

                                                            Text(
                                                              val["text"],
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                color: txtcolor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),

                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            LinearProgressIndicator(
                                                              value: 0.5,
                                                              backgroundColor:
                                                                  Colors
                                                                      .grey[300],
                                                              minHeight: 8,
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    50,
                                                                  ),
                                                            ),

                                                            SizedBox(
                                                              height: 10,
                                                            ),

                                                            Text(
                                                              "2 Products",
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                color: txtcolor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
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

                                      SizedBox(height: 25),
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
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                        left: 15,
                                                      ),
                                                      child: Text(
                                                        'All Product',
                                                        style: TextStyle(
                                                          color: txtcolor,
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),

                                                  SizedBox(
                                                    width: double.infinity,
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
                                                        columnSpacing: 15,
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
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),

                                                          DataColumn(
                                                            label: Text(
                                                              'Category',
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
                                                              'Sub Category',
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
                                                              'Price',
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
                                                                      value["name"],
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
                                                                  value['category'],
                                                                  style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color:
                                                                        txtcolor,
                                                                  ),
                                                                ),
                                                              ),

                                                              DataCell(
                                                                Text(
                                                                  value['subCategory'],
                                                                  style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color:
                                                                        txtcolor,
                                                                  ),
                                                                ),
                                                              ),

                                                              DataCell(
                                                                Text(
                                                                  value['price']
                                                                      .toString(),
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
                                                    'Order Details',
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      color: txtcolor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              SizedBox(height: 50),
                                              CircularPercentIndicator(
                                                radius: 110.0,
                                                lineWidth: 20,
                                                percent: 0.8,
                                                progressColor:
                                                    Colors.deepPurpleAccent,
                                                center: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '3',
                                                      style: TextStyle(
                                                        fontSize: 28,
                                                        color: txtcolor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),

                                                    Text(
                                                      'Orders',
                                                      style: TextStyle(
                                                        fontSize: 24,
                                                        color: txtcolor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              SizedBox(height: 50),
                                              ListView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: 5,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    padding: EdgeInsets.all(5),
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                          vertical: 10,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10,
                                                          ),
                                                      border: Border.all(
                                                        color: Colors.white
                                                            .withValues(
                                                              alpha: 0.8,
                                                            ),
                                                        width: 1,
                                                      ),
                                                    ),

                                                    child: ListTile(
                                                      leading: Icon(
                                                        Icons
                                                            .delivery_dining_outlined,
                                                        size: 25,
                                                      ),
                                                      title: Text(
                                                        'All Orders',
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          color: txtcolor,
                                                        ),
                                                      ),
                                                      subtitle: Text(
                                                        '3 Orders',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: txtcolor,
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

double _myproducts(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth >= 1773 && screenWidth <= 1825) {
    return 250; // wider cards, fewer columns
  } else if (screenWidth >= 1500 && screenWidth <= 1770) {
    return 290; // narrower cards, more columns
  } else if (screenWidth >= 1285 && screenWidth <= 1425) {
    return 330; // narrower cards, more columns
  } else if (screenWidth < 1285) {
    return 350; // mobile, smaller cards
  }

  return 300; // fallback
}

double _myproductsAspectRatio(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth >= 1500 && screenWidth <= 1731) {
    return 1.5;
  } else if (screenWidth >= 1252 && screenWidth <= 1368) {
    return 1.8;
  } else if (screenWidth <= 1249) {
    return 1.65;
  } else if (screenWidth >= 1732 && screenWidth <= 1738) {
    return 1.3;
  }

  return 1.4;
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
