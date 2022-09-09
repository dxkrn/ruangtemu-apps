import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/themes.dart';

import '../Widgets/rounded_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                      'Ruang Temu',
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
                      onPressed: () {},
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
