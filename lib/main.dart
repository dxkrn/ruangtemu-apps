import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Pages/Features/Aspirasi/ruang_aspirasi_form.dart';
import 'Pages/Features/Aspirasi/ruang_aspirasi_page.dart';
import 'Pages/Features/Aspirasi/ruang_aspirasi_thanks.dart';
import 'Pages/Features/HaloUNY/halouny_page.dart';
import 'Pages/home_page.dart';
import 'Pages/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/onboard': (context) => const OnboardPage(),

          //HaloUNY!
          '/halouny': (context) => const HalounyPage(),

          //Aspirasi
          '/aspirasi': (context) => const RuangAspirasiForm(),
          '/aspirasiThanks': (context) => const RuangAspirasiThanks(),
          '/aspirasiPage': (context) => const RuangAspirasiPage(),
        },
      ),
      designSize: const Size(375, 667),
    );
  }
}
