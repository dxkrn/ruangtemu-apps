import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/themes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'RUANG TEMU',
                    style: heading1BoldTextStyle.copyWith(
                      color: blueColor,
                    ),
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
                ],
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 25.h,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'by BEM KM UNY',
                    style: heading2TextStyle.copyWith(
                      color: blueColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
