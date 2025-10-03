import 'dart:ui';
import 'package:ecommerce_admin/Core/Auth/auth_service.dart';
import 'package:ecommerce_admin/Core/Theme/colors.dart';
import 'package:ecommerce_admin/Model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class TabletMainScreen extends HookConsumerWidget {
  TabletMainScreen({super.key});

  final toSignUp = StateProvider<bool>((ref) => true);
  final authProvider = StateProvider<AuthService>((ref) => AuthService());
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

    final toTablet = MediaQuery.of(context).size.width < 801;
    final smallHeight = MediaQuery.of(context).size.height < 815;
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

                        child: AnimatedSwitcher(
                          transitionBuilder: (child, animation) {
                            final offset = Tween<Offset>(
                              begin: selectedSignUp
                                  ? Offset(-1.0, 0.0)
                                  : Offset(1.0, 0.0),
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
                                      loginusernamecontroller,
                                      loginpasswordcontroller,
                                      toSignUp,
                                      authProvider,
                                      ref,
                                      loginKey,
                                      loginpasswordvisible,
                                    ),
                                    toTablet
                                        ? SizedBox.shrink()
                                        : _imageLogin(),
                                  ],
                                )
                              : Row(
                                  key: ValueKey(2),
                                  children: [
                                    toTablet
                                        ? SizedBox.shrink()
                                        : _imageSignUp(),

                                    _signUp(
                                      context,
                                      toTablet,
                                      usernamecontroller, // Username
                                      emailcontroller, // Email
                                      passwordcontroller, // Password
                                      confirmpasswordcontroller, // Confirm Password
                                      toSignUp,
                                      authProvider,
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

          smallHeight
              ? SizedBox.shrink()
              : Positioned(
                  left: -100,
                  top: -200,
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/glassbg.png',
                      fit: BoxFit.cover,
                      height: 500,
                      width: 500,
                    ),
                  ),
                ),

          smallHeight
              ? SizedBox.shrink()
              : Positioned(
                  right: -100,
                  bottom: -200,
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
  TextEditingController emailcontroller,
  TextEditingController passwordcontroller,
  TextEditingController confirmpasswordcontroller,
  StateProvider<bool> toSignUp,
  StateProvider<AuthService> authService,
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
      ref.read(toSignUp.notifier).state = true;
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
    child: Expanded(
      flex: 1,
      child: Container(
        height: 600,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: toTablet
              ? BorderRadius.circular(20)
              : BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 0),
            Text(
              'SIGN UP',
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'Sono',
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: _textfield(context)),
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
              padding: EdgeInsets.symmetric(
                horizontal: _textfield(context),
                vertical: 15,
              ),
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
              padding: EdgeInsets.symmetric(horizontal: _textfield(context)),
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

                  suffixIcon: IconButton(
                    onPressed: () {
                      ref.read(passwordVisible.notifier).state = !visible;
                    },
                    icon: Icon(
                      visible ? Icons.visibility : Icons.visibility_off,
                    ),
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
              padding: EdgeInsets.symmetric(
                horizontal: _textfield(context),
                vertical: 15,
              ),
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

                  suffixIcon: IconButton(
                    onPressed: () {
                      ref.read(confirmpasswordVisible.notifier).state =
                          !confirmpassvisible;
                    },
                    icon: Icon(
                      confirmpassvisible
                          ? Icons.visibility
                          : Icons.visibility_off,
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

            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                // Router.neglect(context, () {
                if (signupKey.currentState!.validate()) {
                  handleRegister();
                  // });
                }
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
              padding: EdgeInsets.symmetric(horizontal: _signup(context)),
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
          ],
        ),
      ),
    ),
  );
}

Widget _login(
  BuildContext context,
  bool toTablet,
  TextEditingController loginusernamecontroller,
  TextEditingController loginpasswordcontroller,
  StateProvider<bool> toSignUp,
  StateProvider<AuthService> authService,
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
    child: Expanded(
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
            SizedBox(height: 0),
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
              padding: EdgeInsets.symmetric(horizontal: _textfield(context)),
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

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Input Username';
                  }
                  return null;
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: _textfield(context),
                vertical: 15,
              ),
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

                  suffixIcon: IconButton(
                    onPressed: () {
                      ref.read(loginpasswordvisible.notifier).state = !showPass;
                    },
                    icon: Icon(
                      showPass ? Icons.visibility : Icons.visibility_off,
                    ),
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

            SizedBox(height: 35),
            ElevatedButton(
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
              padding: EdgeInsets.symmetric(horizontal: _signup(context)),
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

            SizedBox(height: 25),
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
    ),
  );
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

double _signup(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth >= 1000 && screenWidth <= 1095) {
    return 80;
  } else if (screenWidth >= 914 && screenWidth <= 999) {
    return 60;
  } else if (screenWidth >= 801 && screenWidth <= 914) {
    return 35;
  } else if (screenWidth >= 690 && screenWidth <= 800) {
    return 65;
  } else if (screenWidth >= 576 && screenWidth <= 689) {
    return 45;
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
