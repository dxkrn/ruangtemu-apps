import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/themes.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Widgets/rounded_button.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId:
      '763154572711-rkl4e9i79do2imm553uhqil350e6harr.apps.googleusercontent.com',
  serverClientId:
      '821080673605-djicbo65f7qd9el2sr7sg6nnhgaa2756.apps.googleusercontent.com',
  scopes: [
    'email',
    'profile',
  ],
);

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GoogleSignInAccount? _currentUser;

  Future<void> _handleSignIn() async {
    try {
      print('sign in');
      if (_currentUser != null) {
        await _googleSignIn.signOut();
        print('Signed out');
      }
      GoogleSignInAccount? account = await _googleSignIn.signIn();

      GoogleSignInAuthentication? authentication =
          await account?.authentication;

      String? accessToken = authentication?.accessToken;

      print('access token : $accessToken');
      print('account : $account');
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
        print(account);
      });
    });
    // _googleSignIn.signInSilently();
  }

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 80.h,
                    ),
                    Text(
                      'Ruang Temu ',
                      style: heading1BoldTextStyle.copyWith(
                        color: blueColor,
                        fontSize: 30.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: 170.w,
                      height: 235.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/logo_kabinet.png',
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: 250.w,
                      height: 50,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: greyColor,
                      ),
                      child: Center(
                        child: TextField(
                          style: heading1MediumTextStyle.copyWith(
                            color: blueColor,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: heading1MediumTextStyle.copyWith(
                              color: blueColor.withAlpha(90),
                            ),
                            hintText: 'Your Email',
                            icon: Icon(
                              Icons.person,
                              color: blueColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: 250.w,
                      height: 50,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: greyColor,
                      ),
                      child: Center(
                        child: TextField(
                          obscureText: obscureText,
                          style: heading1MediumTextStyle.copyWith(
                            color: blueColor,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: heading1MediumTextStyle.copyWith(
                              color: blueColor.withAlpha(90),
                            ),
                            hintText: 'Your Password',
                            icon: Icon(
                              Icons.lock,
                              color: blueColor,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              icon: Icon(
                                obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: blueColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    RoundedButton(
                      width: 250.w,
                      height: 50,
                      text: 'Login',
                      buttonColor: blueColor,
                      textColor: whiteColor,
                      onPressed: () {
                        _handleSignIn();
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
