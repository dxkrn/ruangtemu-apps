import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ruang_temu_apps/Pages/Features/Aspirasi/ruang_aspirasi_comment_page.dart';
import 'package:ruang_temu_apps/themes.dart';

class AspirasiCard extends StatelessWidget {
  AspirasiCard({
    Key? key,
    required this.id,
    required this.imgSrc,
    required this.name,
    required this.content,
    required this.commentCount,
  }) : super(key: key);
  int id;
  String? imgSrc;
  String name;
  String content;
  int commentCount;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: deviceWidth - 48.w,
          height: 150.h,
          decoration: BoxDecoration(
            color: yellowColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 35.h,
                child: Row(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          child: Container(
                            // rounded corners
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: imgSrc != null
                                  ? DecorationImage(
                                      image: NetworkImage(imgSrc!),
                                      fit: BoxFit.cover,
                                    )
                                  : const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/img_male_avatar.png"),
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
                          width: 250.w,
                          height: 35.h,
                          child: Text(
                            name,
                            style: heading1MediumTextStyle.copyWith(
                              color: blueColor,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                // color: blueColor,
                width: 300.w,
                height: 60.h,
                child: Text(
                  content,
                  style: heading2TextStyle.copyWith(
                    color: blueColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 3,
                ),
              ),
              Container(
                width: deviceWidth - 50.w,
                height: 0.5,
                decoration: BoxDecoration(
                  color: blueColor,
                ),
              ),
              SizedBox(
                // color: blueColor,
                width: 300.w,
                height: 30.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '$commentCount Komentar',
                      style: heading4TextStyle.copyWith(
                        color: blueColor,
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: 20.h,
                        height: 20.h,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icons/icon_comment.png'),
                          ),
                        ),
                      ),
                      onTap: () {
                        Get.to(
                          RuangAspirasiCommentPage(
                            aspirationId: id,
                            name: name,
                            content: content,
                            imgSrc: imgSrc,
                            aspirasiCommentCount: commentCount,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
