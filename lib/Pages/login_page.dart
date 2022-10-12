import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ruang_temu_apps/StateController/user_controller.dart';
import 'package:ruang_temu_apps/env.dart';
import 'package:ruang_temu_apps/http_client.dart';
import 'package:ruang_temu_apps/themes.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Widgets/rounded_button.dart';
import 'package:ruang_temu_apps/env.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
  ],
);

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String warning = '';
  final box = GetStorage();

  @override
  initState() {
    super.initState();

    if (box.read("api_key") != null) {
      print("already has token");
      handleMoveOut();
      return;
    }
  }

  Future<void> _handleSignIn() async {
    try {
      if (box.read("api_key") != null) {
        print("already has token");
        handleMoveOut();
        return;
      }

      print('sign in');

      if (await _googleSignIn.isSignedIn()) {
        await _googleSignIn.signOut();
      }

      GoogleSignInAccount? account = await _googleSignIn.signIn();

      GoogleSignInAuthentication? authentication =
          await account?.authentication;

      String? accessToken = authentication?.accessToken;
      print("accessToken: $accessToken");
      final res = await httpClient
          .post("$baseAPIUrl/login", {"token": accessToken ?? ""});

      print("$baseAPIUrl/login");
      print(res.body);
      dynamic data = jsonDecode(res.body);

      if (data['status'] == true) {
        box.write('api_key', data['token']);
        handleMoveOut();
        print('Signed in');
      } else {
        setState(() {
          warning = data['message'];
        });
      }
    } catch (error) {
      print('error');
      print(error);

      setState(() {
        warning = error.toString();
      });

      if (await _googleSignIn.isSignedIn()) {
        box.remove("api_key");
        await _googleSignIn.signOut();
      }
    }
  }

  void handleMoveOut() async {
    try {
      final res = await httpClient.get("$baseAPIUrl/me");
      dynamic data = jsonDecode(res.body);

      if (data != null) {
        final user = User.fromJson(data);
        Get.find<UserController>().setUser(user);

        if (user.studyprogram == null &&
            await box.read("finish-onboard") == null) {
          Get.offNamed('/onboard');
        } else {
          Get.offAndToNamed("/");
        }
      } else {
        Get.find<UserController>().clearUser();

        setState(() {
          warning = 'Gagal mendapatkan data user';
        });

        if (await _googleSignIn.isSignedIn()) {
          box.remove("api_key");
          await _googleSignIn.signOut();
        }
      }
    } catch (e) {
      Get.find<UserController>().clearUser();

      setState(() {
        warning = 'Gagal mendapatkan data user';
      });
      if (await _googleSignIn.isSignedIn()) {
        box.remove("api_key");
        await _googleSignIn.signOut();
      }
    }
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
                    // SizedBox(
                    //   height: 10.h,
                    // ),
                    // Container(
                    //   width: 250.w,
                    //   height: 50,
                    //   padding: EdgeInsets.symmetric(
                    //     horizontal: 10.w,
                    //   ),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(30.r),
                    //     color: greyColor,
                    //   ),
                    //   child: Center(
                    //     child: TextField(
                    //       style: heading1MediumTextStyle.copyWith(
                    //         color: blueColor,
                    //       ),
                    //       decoration: InputDecoration(
                    //         border: InputBorder.none,
                    //         hintStyle: heading1MediumTextStyle.copyWith(
                    //           color: blueColor.withAlpha(90),
                    //         ),
                    //         hintText: 'Your Email',
                    //         icon: Icon(
                    //           Icons.person,
                    //           color: blueColor,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10.h,
                    // ),
                    // Container(
                    //   width: 250.w,
                    //   height: 50,
                    //   padding: EdgeInsets.symmetric(
                    //     horizontal: 10.w,
                    //   ),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(30.r),
                    //     color: greyColor,
                    //   ),
                    //   child: Center(
                    //     child: TextField(
                    //       obscureText: obscureText,
                    //       style: heading1MediumTextStyle.copyWith(
                    //         color: blueColor,
                    //       ),
                    //       decoration: InputDecoration(
                    //         border: InputBorder.none,
                    //         hintStyle: heading1MediumTextStyle.copyWith(
                    //           color: blueColor.withAlpha(90),
                    //         ),
                    //         hintText: 'Your Password',
                    //         icon: Icon(
                    //           Icons.lock,
                    //           color: blueColor,
                    //         ),
                    //         suffixIcon: IconButton(
                    //           onPressed: () {
                    //             setState(() {
                    //               obscureText = !obscureText;
                    //             });
                    //           },
                    //           icon: Icon(
                    //             obscureText
                    //                 ? Icons.visibility_off
                    //                 : Icons.visibility,
                    //             color: blueColor,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 10.h,
                    ),
                    warning.isNotEmpty
                        ? Text(warning,
                            style: heading1MediumTextStyle.copyWith(
                                fontSize: 26, color: Colors.red))
                        : Container(),
                    RoundedButton(
                      width: 250.w,
                      height: 50,
                      text: 'Login SSO',
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
