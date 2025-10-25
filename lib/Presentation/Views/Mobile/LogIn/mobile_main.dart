import 'dart:ui';
import 'package:ecommerce_admin/Core/Services/auth_service.dart';
import 'package:ecommerce_admin/Core/Theme/colors.dart';
import 'package:ecommerce_admin/Domain/Entities/UserEntities/user_entities.dart';
import 'package:ecommerce_admin/Presentation/Provider/username_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/legacy.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class MobileMainScreen extends HookConsumerWidget {
  MobileMainScreen({super.key});

  final selectSignUp = StateProvider<bool>((ref) => true);
  final authService = StateProvider<AuthService>((ref) => AuthService());
  final passwordVisible = StateProvider<bool>((ref) => false);
  final confirmpasswordVisible = StateProvider<bool>((ref) => false);
  final loginpasswordvisible = StateProvider<bool>((ref) => false);
  final TextEditingController loginusernamecontroller = TextEditingController();
  final TextEditingController loginpasswordcontroller = TextEditingController();
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmpasswordcontroller =
      TextEditingController();
  final loginKey = GlobalKey<FormState>();
  final signupKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
    final smallHeight = MediaQuery.of(context).size.height < 700;
    final smallScreen = MediaQuery.of(context).size.height < 670;
    final selectedSignUp = ref.watch(selectSignUp);
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
                        height: smallHeight ? 550.h : 480.h,
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

                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),

                          child: selectedSignUp
                              ? Column(
                                  key: ValueKey('1'),
                                  children: [
                                    _logIn(
                                      context,
                                      selectSignUp,
                                      authService,
                                      loginusernamecontroller,
                                      loginpasswordcontroller,
                                      ref,
                                      loginKey,
                                      loginpasswordvisible,
                                    ),
                                  ],
                                )
                              : Column(
                                  key: ValueKey('2'),
                                  children: [
                                    _signUp(
                                      context,
                                      selectSignUp,
                                      authService,
                                      usernamecontroller,
                                      emailcontroller,
                                      passwordcontroller,
                                      confirmpasswordcontroller,
                                      ref,
                                      signupKey,
                                      passwordVisible,
                                      confirmpasswordVisible,
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
          smallScreen
              ? SizedBox.shrink()
              : Positioned(
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
          smallScreen
              ? SizedBox.shrink()
              : Positioned(
                  right: -100,
                  bottom: -180,
                  child: Transform.rotate(
                    angle: 3,
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/glassbg.png',
                        fit: BoxFit.cover,
                        height: 300,
                        width: 300,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

Widget _logIn(
  BuildContext context,
  StateProvider<bool> selectSignUp,
  StateProvider<AuthService> authService,
  TextEditingController loginusernamecontroller,
  TextEditingController loginpasswordcontroller,
  WidgetRef ref,
  GlobalKey<FormState> loginKey,
  StateProvider<bool> loginpasswordvisible,
) {
  final showPass = ref.watch(loginpasswordvisible);
  final sendLogin = ref.read(authService);
  Future<void> handleLogin() async {
    final response = await sendLogin.login(
      LoginModel(
        username: loginusernamecontroller.text,
        password: loginpasswordcontroller.text,
      ),
    );

    if (response != null && response['message'] == 'Log In Successfully') {
      if (context.mounted) {
        final username = response['username'];
        final container = ProviderScope.containerOf(context);

        container.read(usernameProvider.notifier).state = username;
        context.go('/HomePage');
      }
    } else {
      if (context.mounted) {
        showTopSnackBar(
          Overlay.of(context),
          Material(
            color: Colors.transparent,
            child: AwesomeSnackbarContent(
              title: 'Failed!',
              message: 'Check Your Username and Password Properly',
              contentType: ContentType.failure,
            ),
          ),
          animationDuration: const Duration(milliseconds: 600),
          displayDuration: const Duration(seconds: 2),
        );
      }
    }
  }

  return Form(
    key: loginKey,
    autovalidateMode: AutovalidateMode.disabled,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 25.h),
        Text(
          'LOGIN',
          style: TextStyle(
            fontSize: 40.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Sono',
          ),
        ),

        SizedBox(height: 25.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: TextFormField(
            controller: loginusernamecontroller,
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

            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Input Username';
              }
              return null;
            },
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          child: TextFormField(
            controller: loginpasswordcontroller,
            obscureText: !showPass,
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

              suffixIcon: IconButton(
                onPressed: () {
                  ref.read(loginpasswordvisible.notifier).state = !showPass;
                },
                icon: Icon(showPass ? Icons.visibility : Icons.visibility_off),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Input Password';
              }
              return null;
            },
          ),
        ),

        SizedBox(height: 30.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: ElevatedButton(
            onPressed: () async {
              // Router.neglect(context, () {
              if (loginKey.currentState!.validate()) {
                handleLogin();
              }
              // });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: Size(380, 45.h),
            ),
            child: Text(
              'Log In',
              style: TextStyle(
                fontSize: 22.sp,
                color: const Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),

        SizedBox(height: 5),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Don't Have an Account Yet?",
                style: TextStyle(fontSize: 13.sp),
              ),

              TextButton(
                onPressed: () {
                  ref.read(selectSignUp.notifier).state = false;
                },
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: txtcolor,
                    fontFamily: 'Sono',
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 10),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all(Size(380.w, 45.h)),

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
                Flexible(
                  child: Text(
                    'Log In using Google',
                    style: const TextStyle(fontSize: 16, color: Colors.black),
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
              minimumSize: WidgetStateProperty.all(Size(380.w, 45.h)),

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
                Flexible(
                  child: Text(
                    'Log In using Facebook',
                    style: TextStyle(fontSize: 16, color: Colors.black),
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
  );
}

Widget _signUp(
  BuildContext context,
  StateProvider<bool> selectSignUp,
  StateProvider<AuthService> authService,
  TextEditingController usernamecontroller,
  TextEditingController emailcontroller,
  TextEditingController passwordcontroller,
  TextEditingController confirmpasswordcontroller,
  WidgetRef ref,
  GlobalKey<FormState> signupKey,
  StateProvider<bool> passwordVisible,
  StateProvider<bool> confirmpasswordVisible,
) {
  final visible = ref.watch(passwordVisible);
  final confirmpassvisible = ref.watch(confirmpasswordVisible);
  final sendRegister = ref.read(authService);
  Future<void> handleRegister() async {
    final response = await sendRegister.register(
      SignUpModel(
        username: usernamecontroller.text,
        email: emailcontroller.text,
        password: passwordcontroller.text,
        confirmpassword: confirmpasswordcontroller.text,
      ),
    );

    if (response != null && response['message'] == 'Registered') {
      ref.read(selectSignUp.notifier).state = true;
      usernamecontroller.clear();
      emailcontroller.clear();
      passwordcontroller.clear();
      confirmpasswordcontroller.clear();
      if (context.mounted) {
        context.go('/');
        showTopSnackBar(
          Overlay.of(context),
          Material(
            color: Colors.transparent,
            child: AwesomeSnackbarContent(
              title: 'Success!',
              message: 'You Successfully Registered Please Log In to Proceed',
              contentType: ContentType.success,
            ),
          ),
          animationDuration: Duration(milliseconds: 800),
          displayDuration: Duration(milliseconds: 6),
        );
      }
    }
  }

  return Form(
    key: signupKey,
    autovalidateMode: AutovalidateMode.disabled,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 20.h),
        Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 40,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Sono',
          ),
        ),

        SizedBox(height: 15.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: TextFormField(
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

            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Input Username';
              }

              if (value.length > 18) {
                return 'Username must not be more than 18 Characters';
              }
              return null;
            },
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          child: TextFormField(
            controller: emailcontroller,
            decoration: InputDecoration(
              hintText: 'Email',
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

            validator: (value) {
              if (value == null ||
                  !RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                  ).hasMatch(value)) {
                return 'Please Input Email';
              }

              return null;
            },
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: TextFormField(
            controller: passwordcontroller,
            obscureText: !visible,
            decoration: InputDecoration(
              hintText: 'Password',
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

              suffixIcon: IconButton(
                onPressed: () {
                  ref.read(passwordVisible.notifier).state = !visible;
                },
                icon: Icon(visible ? Icons.visibility : Icons.visibility_off),
              ),
            ),

            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Input Password';
              }

              if (value.length < 8) {
                return 'Username must be more than 8 Characters';
              }

              if (!value.contains(RegExp(r'[A-Z]'))) {
                return 'Uppercase letter is missing';
              }

              if (!value.contains(RegExp(r'[a-z]'))) {
                return ' letter is missing';
              }

              if (!value.contains(RegExp(r'[0-9]'))) {
                return 'Digit is missing';
              }

              if (!value.contains((RegExp(r'[!@#%^&*(),.?":{}|<>]')))) {
                return 'Special character is missing';
              }

              return null;
            },
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          child: TextFormField(
            controller: confirmpasswordcontroller,
            obscureText: !confirmpassvisible,
            decoration: InputDecoration(
              hintText: 'Confirm Password',
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

              suffixIcon: IconButton(
                onPressed: () {
                  ref.read(confirmpasswordVisible.notifier).state =
                      !confirmpassvisible;
                },
                icon: Icon(
                  confirmpassvisible ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),

            validator: (value) {
              if (passwordcontroller.text.isEmpty) {
                return 'Input a password';
              }
              if (value != passwordcontroller.text) {
                return 'Password does not match';
              }

              return null;
            },
          ),
        ),

        SizedBox(height: 10.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: ElevatedButton(
            onPressed: () async {
              // Router.neglect(context, () {

              if (signupKey.currentState!.validate()) {
                handleRegister();
              }
              // });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: Size(380.w, 45.h),
            ),
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 22,
                color: const Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),

        SizedBox(height: 5),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "already Have an Account?",
                style: TextStyle(fontSize: 13.sp),
              ),

              TextButton(
                onPressed: () {
                  ref.read(selectSignUp.notifier).state = true;
                },
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                ),
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: txtcolor,
                    fontFamily: 'Sono',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
