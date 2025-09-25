import 'dart:ui';
import 'package:ecommerce_admin/Core/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileMainScreen extends HookConsumerWidget {
  const MobileMainScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController usernamecontroller = TextEditingController();
    final TextEditingController passwordcontroller = TextEditingController();
    final controller = useAnimationController(
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);

    final scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.3,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    final colorAnimation = TweenSequence<Color?>([
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.blue[200], end: Colors.purple[200]),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.purple[200], end: Colors.pink[200]),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.pink[200], end: Colors.teal[200]),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.teal[200], end: Colors.blue[200]),
        weight: 1,
      ),
    ]).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.center,
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Transform.scale(
                  scale: scaleAnimation.value,

                  child: Container(
                    height: 100.h,
                    width: 100.w,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Container(
                        height: 480.h,
                        width: 275.w,

                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          border: Border.all(
                            color: const Color.fromARGB(
                              255,
                              0,
                              0,
                              0,
                            ).withValues(alpha: 0.1),
                            width: 1.5.w,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Sono',
                              ),
                            ),

                            SizedBox(height: 25.h),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: TextField(
                                controller: usernamecontroller,
                                decoration: InputDecoration(
                                  hintText: 'Username',
                                  filled: true,
                                  fillColor: bgcolor,
                                  prefixIcon: Icon(
                                    Icons.person_outline,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15.w,
                                    vertical: 10.h,
                                  ),

                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: BorderSide.none,
                                  ),

                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 15.h,
                              ),
                              child: TextField(
                                controller: passwordcontroller,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  filled: true,
                                  fillColor: bgcolor,
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15.w,
                                    vertical: 10.h,
                                  ),

                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: BorderSide.none,
                                  ),

                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 50.h),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Router.neglect(context, () {
                                  context.go('/HomePage');
                                  // });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  minimumSize: Size(380, 60),
                                ),
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: const Color.fromARGB(
                                      255,
                                      255,
                                      255,
                                      255,
                                    ),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 20),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  minimumSize: WidgetStateProperty.all(
                                    Size(380, 60),
                                  ),

                                  side:
                                      WidgetStateProperty.resolveWith<
                                        BorderSide
                                      >((Set<WidgetState> states) {
                                        if (states.contains(
                                          WidgetState.hovered,
                                        )) {
                                          return BorderSide(
                                            color: Colors.red,
                                            width: 2,
                                          );
                                        }

                                        return BorderSide(
                                          color: Colors.black,
                                          width: 1,
                                        );
                                      }),

                                  backgroundColor: WidgetStateProperty.all(
                                    Colors.white,
                                  ),
                                  elevation: WidgetStateProperty.all(0),
                                  splashFactory: NoSplash.splashFactory,
                                  overlayColor: WidgetStateProperty.all(
                                    Colors.transparent,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,

                                  children: [
                                    ClipRRect(
                                      child: Image.asset(
                                        'assets/googleicon.png',
                                        fit: BoxFit.contain,
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),

                                    SizedBox(width: 25),
                                    Flexible(
                                      child: Text(
                                        'Log In using Google',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                        maxLines: 1,
                                        softWrap: true,
                                      ),
                                    ),

                                    SizedBox(width: 20),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 10),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  minimumSize: WidgetStateProperty.all(
                                    Size(380, 60),
                                  ),

                                  side:
                                      WidgetStateProperty.resolveWith<
                                        BorderSide
                                      >((Set<WidgetState> states) {
                                        if (states.contains(
                                          WidgetState.hovered,
                                        )) {
                                          return BorderSide(
                                            color: Colors.blueAccent,
                                            width: 2,
                                          );
                                        }

                                        return BorderSide(
                                          color: Colors.black,
                                          width: 1,
                                        );
                                      }),

                                  backgroundColor: WidgetStateProperty.all(
                                    Colors.white,
                                  ),
                                  elevation: WidgetStateProperty.all(0),
                                  splashFactory: NoSplash.splashFactory,
                                  overlayColor: WidgetStateProperty.all(
                                    Colors.transparent,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      child: Image.asset(
                                        'assets/facebooklogo.png',
                                        fit: BoxFit.contain,
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),

                                    SizedBox(width: 25),
                                    Flexible(
                                      child: Text(
                                        'Log In using Facebook',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                        maxLines: 1,
                                        softWrap: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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

          Positioned(
            left: -70,
            top: -180,
            child: ClipRRect(
              child: Image.asset(
                'assets/glassbg.png',
                fit: BoxFit.cover,
                height: 300,
                width: 300,
              ),
            ),
          ),

          Positioned(
            right: -100,
            bottom: -180,
            child: Transform.rotate(
              angle: 3,
              child: ClipRRect(
                child: Image.asset(
                  'assets/glassbg.png',
                  fit: BoxFit.cover,
                  height: 350,
                  width: 350,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
