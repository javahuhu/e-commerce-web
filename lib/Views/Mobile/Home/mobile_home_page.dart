import 'dart:ui';
import 'package:ecommerce_admin/core/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:hooks_riverpod/legacy.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class MobileHomePage extends HookConsumerWidget {
  MobileHomePage({super.key});

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
            final theTry = MediaQuery.of(context).size.height;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (width >= 575 && context.mounted) {
                context.pop();
              }
            });

            return Consumer(
              builder: (context, ref, child) {
                final selected = ref.watch(selectedValue);
                return Dialog(
                  elevation: 5,
                  child: Container(
                    height: theTry * 0.575,
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
                              fontSize: 22.sp,
                              color: txtcolor,
                            ),
                          ),
                        ),

                        SizedBox(height: 10),
                        GlassmorphicContainer(
                          width: double.infinity,
                          height: theTry * 0.45,
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
                          child: Scrollbar(
                            thumbVisibility: true,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(height: 30),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 25,
                                    ),
                                    child: SizedBox(
                                      height: theTry * 0.5,
                                      child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 150.w,
                                              mainAxisSpacing: 10,
                                              crossAxisSpacing: 10,
                                              childAspectRatio: 1,
                                            ),
                                        itemCount: upload.length,
                                        itemBuilder: (context, index) {
                                          final val = upload[index];
                                          return GestureDetector(
                                            onTap: () {},
                                            child: MouseRegion(
                                              cursor: SystemMouseCursors.click,
                                              child: Container(
                                                width: 100.w,
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
                                                        size: 27.sp,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(height: 15),
                                                    Text(
                                                      val['label'],
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15.sp,
                                                      ),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 30,
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Product Name',
                                        filled: false,
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black54,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),

                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 15),

                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 30,
                                    ),
                                    child: Container(
                                      height: 100.h,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black54,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),

                                      child: TextField(
                                        scrollPhysics:
                                            NeverScrollableScrollPhysics(),
                                        textAlignVertical:
                                            TextAlignVertical.top,
                                        maxLines: null,
                                        expands: true,
                                        decoration: InputDecoration(
                                          hintText: 'Product Details',
                                          filled: false,
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                          ),

                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 15),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 30,
                                    ),
                                    child: Wrap(
                                      spacing: 15,
                                      runSpacing: 10,
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
                                            width: 270.w,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Colors.black54,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                          dropdownStyleData: DropdownStyleData(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          value:
                                              options.contains(selected[label])
                                              ? selected[label]
                                              : null,
                                          style: TextStyle(
                                            fontSize: 15.sp,
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
                                            ref
                                                .read(selectedValue.notifier)
                                                .state = {
                                              ...selected,
                                              label: newValue,
                                            };
                                          },
                                        );
                                      }).toList(),
                                    ),
                                  ),

                                  SizedBox(height: 15),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 30,
                                    ),
                                    child: Wrap(
                                      spacing: 15,
                                      runSpacing: 10,
                                      children: [
                                        SizedBox(
                                          width: 270.w,
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: 'Price',
                                              filled: false,
                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: Colors.black54,
                                                  width: 2,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: Colors.black54,
                                                  width: 2,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          width: 270.w,
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: 'Offer Price',
                                              filled: false,
                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: Colors.black54,
                                                  width: 2,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: Colors.black54,
                                                  width: 2,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          width: 270.w,

                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: 'Quantity',
                                              filled: false,
                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: Colors.black54,
                                                  width: 2,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 30,
                                    ),
                                    child: Wrap(
                                      spacing: 29,
                                      runSpacing: 10,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            splashFactory:
                                                NoSplash.splashFactory,
                                            shadowColor: Colors.transparent,
                                            elevation: 0,
                                            backgroundColor:
                                                const Color.fromARGB(
                                                  255,
                                                  240,
                                                  124,
                                                  124,
                                                ),
                                            foregroundColor:
                                                const Color.fromARGB(
                                                  255,
                                                  255,
                                                  255,
                                                  255,
                                                ),
                                            minimumSize: Size(250.w, 50.h),
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            splashFactory:
                                                NoSplash.splashFactory,
                                            shadowColor: Colors.transparent,
                                            elevation: 0,
                                            backgroundColor:
                                                const Color.fromARGB(
                                                  255,
                                                  128,
                                                  196,
                                                  130,
                                                ),
                                            foregroundColor:
                                                const Color.fromARGB(
                                                  255,
                                                  255,
                                                  255,
                                                  255,
                                                ),
                                            minimumSize: Size(250.w, 50.h),
                                          ),
                                          child: Text(
                                            'Save',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 25.h),
                                ],
                              ),
                            ),
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
    // ... (rest of your products list)
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
                      _myProductsSection(context, ref, gridWidth),
                      _orderDetailsSection(context),
                      SizedBox(height: 25),
                      _allProductsSection(context),
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
                padding: EdgeInsets.only(top: 20.h, left: 30.w),
                child: Text(
                  'Good morning, Mike',
                  style: TextStyle(
                    fontSize: 28.sp,
                    color: txtcolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 40),
                child: Text(
                  "Let's make this day productive",
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

  Widget _myProductsSection(
    BuildContext context,
    WidgetRef ref,
    double gridWidth,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: 20.h, bottom: 10.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(right: 20),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _myProductsHeader(context, ref),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: myproducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    final val = myproducts[index];
                    return Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(3),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(3),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: Icon(val["Icons"], size: 15.sp),
                                ),

                                GestureDetector(
                                  onTap: () {},
                                  child: Icon(Icons.more_vert, size: 15.sp),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            val["text"],
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: txtcolor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          LinearProgressIndicator(
                            value: 0.5,
                            backgroundColor: Colors.grey[300],
                            minHeight: 8,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "2 Products",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: txtcolor,
                              fontWeight: FontWeight.bold,
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
    );
  }

  Widget _myProductsHeader(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Products",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: txtcolor,
              ),
            ),
            Spacer(),

            GestureDetector(
              onTap: () {
                _showAddNew(context, ref);
              },
              child: Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.add, color: Colors.black, size: 25),
                    Text(
                      "Add New",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(200, 50, 50, 50),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 5),
            Icon(Icons.refresh, color: Colors.black, size: 25.sp),
          ],
        ),
      ),
    );
  }

  Widget _orderDetailsSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            margin: EdgeInsets.only(right: 20),
            padding: EdgeInsets.all(20),
            width: double.infinity,
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
              borderRadius: BorderRadius.circular(20.r),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.w, top: 10.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Order Details',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: txtcolor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                Transform.translate(
                  offset: Offset(0, 15),
                  child: CircularPercentIndicator(
                    radius: 70.0.r,
                    lineWidth: 15,
                    percent: 0.8,
                    progressColor: Colors.deepPurpleAccent,
                    center: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '3',
                          style: TextStyle(
                            fontSize: 22.sp,
                            color: txtcolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          'Orders',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: txtcolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 25),

                SizedBox(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: _orderDetailsRatio(context),
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 15,
                    ),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.8),
                            width: 1,
                          ),
                        ),

                        child: ListTile(
                          leading: Icon(
                            Icons.delivery_dining_outlined,
                            size: 15,
                          ),
                          title: Text(
                            'All Orders',
                            style: TextStyle(fontSize: 18.sp, color: txtcolor),
                          ),
                          subtitle: Text(
                            '3 Orders',
                            style: TextStyle(fontSize: 15.sp, color: txtcolor),
                          ),
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'All Product',
                      style: TextStyle(
                        color: txtcolor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.497,
                  width: double.infinity,
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
                          columnSpacing: 50,
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
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Category',
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
                                'Price',
                                style: TextStyle(
                                  color: txtcolor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Edit',
                                style: TextStyle(
                                  color: txtcolor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Delete',
                                style: TextStyle(
                                  color: txtcolor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
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
                                    color: const Color.fromARGB(
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
                                    color: Colors.red,
                                    size: 20,
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

double _orderDetailsRatio(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth >= 392 && screenWidth <= 440) {
    return 3.5;
  } else if (screenWidth >= 362 && screenWidth <= 391) {
    return 2.9;
  } else if (screenWidth <= 361) {
    return 2.7;
  }
  return 4;
}
