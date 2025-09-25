import 'dart:ui';
import 'package:ecommerce_admin/Core/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TabletMainScreen extends HookConsumerWidget {
  const TabletMainScreen({super.key});
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

    final toTablet = MediaQuery.of(context).size.width < 801;
    final smallHeight = MediaQuery.of(context).size.height < 601;
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: _containerHeight(context),
                        width: _containerWidth(context),

                        decoration: BoxDecoration(
                          color: bgcolor.withValues(alpha: 0.2),
                          border: Border.all(
                            color: const Color.fromARGB(
                              255,
                              0,
                              0,
                              0,
                            ).withValues(alpha: 0.1),
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

                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 600,
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: toTablet
                                      ? BorderRadius.circular(20)
                                      : BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20),
                                        ),
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

                                    SizedBox(height: 25),

                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: _textfield(context),
                                      ),
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
                                            horizontal: 15,
                                            vertical: 10,
                                          ),

                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                            borderSide: BorderSide.none,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                            borderSide: BorderSide.none,
                                          ),

                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: _textfield(context),
                                        vertical: 15,
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
                                            horizontal: 15,
                                            vertical: 10,
                                          ),

                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                            borderSide: BorderSide.none,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                            borderSide: BorderSide.none,
                                          ),

                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 100),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Router.neglect(context, () {
                                        context.go('/HomePage');
                                        // });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        minimumSize: Size(325, 60),
                                      ),
                                      child: Text(
                                        'Log In',
                                        style: TextStyle(
                                          fontSize: 15,
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

                                    SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        minimumSize: WidgetStateProperty.all(
                                          Size(325, 60),
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

                                        backgroundColor:
                                            WidgetStateProperty.all(
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
                                          Text(
                                            'Log In using Google',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                            ),
                                          ),

                                          SizedBox(width: 20),
                                        ],
                                      ),
                                    ),

                                    SizedBox(height: 10),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        minimumSize: WidgetStateProperty.all(
                                          Size(325, 60),
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

                                        backgroundColor:
                                            WidgetStateProperty.all(
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
                                          Text(
                                            'Log In using Facebook',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            toTablet
                                ? SizedBox.shrink()
                                : Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 600,
                                      width: 598,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/personanalysis.jpg',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        ),
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

          smallHeight ? SizedBox.shrink() :
          Positioned(
            left: -70,
            top: -180,
            child: ClipRRect(
              child: Image.asset(
                'assets/glassbg.png',
                fit: BoxFit.cover,
                height: 500,
                width: 500,
              ),
            ),
          ),
          
          smallHeight ? SizedBox.shrink() :
          Positioned(
            right: -100,
            bottom: -180,
            child: Transform.rotate(
              angle: 3,
              child: ClipRRect(
                child: Image.asset(
                  'assets/glassbg.png',
                  fit: BoxFit.cover,
                  height: 500,
                  width: 500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

double _textfield(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth >= 825 && screenWidth <= 1099) {
    return 100;
  } else if (screenWidth < 824) {
    return 90;
  }

  return 140;
}

double _containerHeight(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth >= 771 && screenWidth <= 825) {
    return 600;
  } else if (screenWidth < 771) {
    return 600;
  }

  return 600;
}

double _containerWidth(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth >= 700 && screenWidth <= 800) {
    return 500;
  } else if (screenWidth < 700) {
    return 450;
  }

  return 1200;
}
