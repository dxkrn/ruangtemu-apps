import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/Widgets/custom_scroll.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';
import 'package:ruang_temu_apps/themes.dart';

class RuangAspirasiComment extends StatefulWidget {
  const RuangAspirasiComment({super.key});

  @override
  State<RuangAspirasiComment> createState() => _RuangAspirasiCommentState();
}

class _RuangAspirasiCommentState extends State<RuangAspirasiComment> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: FeatureAppbar(
        title: 'Ruang Aspirasi',
        iconSrc: 'assets/icons/icon_mail.png',
      ),
      body: Stack(
        children: [
          SizedBox(
            width: deviceWidth,
            height: deviceHeight,
            // color: Colors.blueGrey,
            child: ScrollConfiguration(
              behavior: CustomScroll(),
              child: ListView(
                children: [
                  SizedBox(
                    height: deviceHeight * 1 / 3,
                  ),
                  CommentCard(deviceWidth: deviceWidth),
                  CommentCard(deviceWidth: deviceWidth),
                  CommentCard(deviceWidth: deviceWidth),
                  CommentCard(deviceWidth: deviceWidth),
                  CommentCard(deviceWidth: deviceWidth),
                  CommentCard(deviceWidth: deviceWidth),
                  CommentCard(deviceWidth: deviceWidth),
                  CommentCard(deviceWidth: deviceWidth),
                  CommentCard(deviceWidth: deviceWidth),
                  CommentCard(deviceWidth: deviceWidth),
                  CommentCard(deviceWidth: deviceWidth),
                  CommentCard(deviceWidth: deviceWidth),
                  SizedBox(
                    height: 100.h,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 24,
            child: Container(
              width: deviceWidth - 48,
              height: deviceHeight * 1 / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.r),
                  bottomRight: Radius.circular(40.r),
                ),
                color: whiteColor,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: deviceHeight * 1 / 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.r),
                        color: blueColor,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: deviceWidth - 63,
                      height: deviceHeight * 1 / 3 - 10.w,
                      decoration: BoxDecoration(
                        color: yellowColor,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/img_male_avatar.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                width: 230.w,
                                height: 35.h,
                                child: Text(
                                  "Johan Brodi",
                                  style: heading1MediumTextStyle.copyWith(
                                    color: blueColor,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          SizedBox(
                            // color: blueColor,
                            width: 300.w,
                            height: deviceHeight * 1 / 3 - 82.w,
                            child: SingleChildScrollView(
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                style: heading2TextStyle.copyWith(
                                  color: blueColor,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 999999,
                              ),
                            ),
                          ),
                        ],
                      ),
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
}

class CommentCard extends StatelessWidget {
  const CommentCard({
    Key? key,
    required this.deviceWidth,
  }) : super(key: key);

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 10,
      ),
      child: Container(
        width: deviceWidth - 48,
        // height: 100.h,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: yellowColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.r),
            bottomLeft: Radius.circular(30.r),
            bottomRight: Radius.circular(30.r),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/img_female_avatar.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 230.w,
                  height: 35.h,
                  child: Text(
                    "Anastasya Jasmine",
                    style: heading1MediumTextStyle.copyWith(
                      color: blueColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              // color: blueColor,
              width: 300.w,
              child: Text(
                "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                style: heading2TextStyle.copyWith(
                  color: blueColor,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 999999,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
