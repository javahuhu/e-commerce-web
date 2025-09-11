import 'dart:ui';
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
                    blurRadius: 50,
                    spreadRadius: 200,
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
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color.fromARGB(172, 225, 227, 229),
                    Color.fromARGB(178, 255, 255, 255),
                    Color.fromARGB(172, 225, 227, 229),
                    Color.fromARGB(172, 225, 227, 229),
                    Color.fromARGB(172, 225, 227, 229),
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
                      style: TextStyle(fontSize: 35, color: Color(0xFF323232)),
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
                              color: dark
                                  ? Color(0xFF323232)
                                  : Colors.grey[300],
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
                                  color: dark
                                      ? Color(0xFF323232)
                                      : Colors.amberAccent,
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

              SizedBox(height: 100),
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 500,
                          width: 150,
                          child: ListView.separated(
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
                                  color: Color(0xFF323232),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
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
