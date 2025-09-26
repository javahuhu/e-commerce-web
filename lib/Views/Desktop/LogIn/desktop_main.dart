import 'dart:ui';
import 'package:ecommerce_admin/Core/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DesktopMainScreen extends HookConsumerWidget {
  DesktopMainScreen({super.key});

  final toSignUp = StateProvider<bool>((ref) => true);

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

    final toTablet = MediaQuery.of(context).size.width < 1215;
    final selectedSignUp = ref.watch(toSignUp);
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
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      child: Container(
                        height: 600,
                        width: toTablet ? 1090 : 1200,
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

                        child: AnimatedSwitcher(
                          transitionBuilder: (child, animation) {
                            final offset = Tween<Offset>(
                              begin: selectedSignUp ? Offset(-1.0, 0.0) :  Offset(1.0, 0.0),
                              end: Offset.zero,
                            ).animate(animation);

                            return SlideTransition(
                              position: offset,
                              child: child,
                            );
                          },
                          duration: Duration(seconds: 1),
                          child: selectedSignUp
                              ? Row(
                                key: ValueKey(1),
                                  children: [
                                    _login(
                                      context,
                                      toTablet,
                                      usernamecontroller,
                                      passwordcontroller,
                                      toSignUp,
                                      ref,
                                    ),

                                    _imageLogin(),
                                  ],
                                )
                              : Row(
                                key: ValueKey(2),
                                  children: [
                                    _imageSignUp(),

                                    _signUp(
                                      context,
                                      toTablet,
                                      usernamecontroller,
                                      passwordcontroller,
                                      toSignUp,
                                      ref,
                                    ),
                                  ],
                                ),
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
                height: 500,
                width: 500,
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



Widget _login(
  BuildContext context,
  bool toTablet,
  TextEditingController usernamecontroller,
  TextEditingController passwordcontroller,
  StateProvider<bool> toSignUp,
  WidgetRef ref,
) {
  return Expanded(
    flex: 1,
    child: Container(
      height: 600,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
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
            padding: EdgeInsets.symmetric(horizontal: 140),
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
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 140, vertical: 15),
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
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          SizedBox(height: 60),
          ElevatedButton(
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
              minimumSize: Size(325, 60),
            ),
            child: Text(
              'Log In',
              style: TextStyle(
                fontSize: 15,
                color: const Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          SizedBox(height: 5),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: toTablet ? 100 : 120),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Don't Have an Account Yet?"),

                TextButton(
                  onPressed: () {
                    ref.read(toSignUp.notifier).state = false;
                  },
                  style: ButtonStyle(
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 15,
                      color: txtcolor,
                      fontFamily: 'Sono',
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all(Size(325, 60)),

              side: WidgetStateProperty.resolveWith<BorderSide>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.hovered)) {
                  return BorderSide(color: Colors.red, width: 2);
                }

                return BorderSide(color: Colors.black, width: 1);
              }),

              backgroundColor: WidgetStateProperty.all(Colors.white),
              elevation: WidgetStateProperty.all(0),
              splashFactory: NoSplash.splashFactory,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
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
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),

                SizedBox(width: 20),
              ],
            ),
          ),

          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all(Size(325, 60)),

              side: WidgetStateProperty.resolveWith<BorderSide>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.hovered)) {
                  return BorderSide(color: Colors.blueAccent, width: 2);
                }

                return BorderSide(color: Colors.black, width: 1);
              }),

              backgroundColor: WidgetStateProperty.all(Colors.white),
              elevation: WidgetStateProperty.all(0),
              splashFactory: NoSplash.splashFactory,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _imageLogin() {
  return Expanded(
    flex: 1,
    child: Container(
      height: 600,
      width: 598,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/personanalysis.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    ),
  );
}

Widget _imageSignUp() {
  return Expanded(
    flex: 1,
    child: Container(
      height: 600,
      width: 598,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/personanalysis.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
    ),
  );
}

Widget _signUp(
  BuildContext context,
  bool toTablet,
  TextEditingController usernamecontroller,
  TextEditingController passwordcontroller,
  StateProvider<bool> toSignUp,
  WidgetRef ref,
) {
  return Expanded(
    flex: 1,
    child: Container(
      height: 600,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            'SIGN UP',
            style: TextStyle(
              fontSize: 40,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Sono',
            ),
          ),

          SizedBox(height: 25),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 140),
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
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 140, vertical: 15),
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
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          SizedBox(height: 60),
          ElevatedButton(
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
              minimumSize: Size(325, 60),
            ),
            child: Text(
              'SIGN UP',
              style: TextStyle(
                fontSize: 15,
                color: const Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          SizedBox(height: 5),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: toTablet ? 100 : 120),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Already Have an Account ?"),

                TextButton(
                  onPressed: () {
                    ref.read(toSignUp.notifier).state = true;
                  },
                  style: ButtonStyle(
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                  ),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 15,
                      color: txtcolor,
                      fontFamily: 'Sono',
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all(Size(325, 60)),

              side: WidgetStateProperty.resolveWith<BorderSide>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.hovered)) {
                  return BorderSide(color: Colors.red, width: 2);
                }

                return BorderSide(color: Colors.black, width: 1);
              }),

              backgroundColor: WidgetStateProperty.all(Colors.white),
              elevation: WidgetStateProperty.all(0),
              splashFactory: NoSplash.splashFactory,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
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
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),

                SizedBox(width: 20),
              ],
            ),
          ),

          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all(Size(325, 60)),

              side: WidgetStateProperty.resolveWith<BorderSide>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.hovered)) {
                  return BorderSide(color: Colors.blueAccent, width: 2);
                }

                return BorderSide(color: Colors.black, width: 1);
              }),

              backgroundColor: WidgetStateProperty.all(Colors.white),
              elevation: WidgetStateProperty.all(0),
              splashFactory: NoSplash.splashFactory,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
