import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../themes.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  final controller = LiquidController();
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            liquidController: controller,
            pages: [
              SinglePage(
                text:
                    'Temukan info perlombaan, beasiswa,\ninternship, dan lain sebagainya.',
                imageSrc: 'assets/images/img_onboarding_1.png',
                bgColor: whiteColor,
                textColor: blueColor,
                dotColor: blueColor,
                controller: controller,
              ),
              SinglePage(
                text: 'Sampaikan aspirasimu\ntanpa rasa ragu.',
                imageSrc: 'assets/images/img_onboarding_2.png',
                bgColor: blueColor,
                textColor: whiteColor,
                dotColor: whiteColor,
                controller: controller,
              ),
              SinglePage(
                text: 'Temukan berbagai barang\nkebutuhan sehari-harimu.',
                imageSrc: 'assets/images/img_onboarding_3.png',
                bgColor: yellowColor,
                textColor: blueColor,
                dotColor: blueColor,
                controller: controller,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

class SinglePage extends StatelessWidget {
  SinglePage({
    Key? key,
    required this.text,
    required this.imageSrc,
    required this.bgColor,
    required this.textColor,
    required this.dotColor,
    required this.controller,
  }) : super(key: key);

  final LiquidController controller;
  Color bgColor;
  Color textColor;
  Color dotColor;
  String text;
  String imageSrc;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: bgColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 375.w,
                  height: 175.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imageSrc),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  text,
                  style: heading2TextStyle.copyWith(
                    color: textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 25.h,
          left: 30.w,
          right: 30.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: (() {
                  Get.offNamed("/");
                }),
                child: Text(
                  'Skip',
                  style: heading1MediumTextStyle.copyWith(
                    color: textColor,
                  ),
                ),
              ),
              AnimatedSmoothIndicator(
                activeIndex: controller.currentPage,
                count: 3,
                effect: WormEffect(
                  spacing: 16.w,
                  dotColor: greyColor,
                  activeDotColor: dotColor,
                ),
                onDotClicked: (index) {
                  controller.jumpToPage(
                    page: index,
                  );
                },
              ),
              TextButton(
                onPressed: (() {
                  controller.animateToPage(page: controller.currentPage + 1);
                  final box = GetStorage();
                  if (controller.currentPage == 2) {
                    Get.offNamed("/");
                    box.write("finish-onboard", "true");
                  }
                }),
                child: Text(
                  'Next',
                  style: heading1BoldTextStyle.copyWith(
                    color: textColor,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
