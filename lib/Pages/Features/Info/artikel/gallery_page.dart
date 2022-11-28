import 'package:android_intent_plus/android_intent.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';
import 'package:ruang_temu_apps/Widgets/navbar.dart';
import 'package:ruang_temu_apps/themes.dart';

class GalleryPageArgs {
  final List<String> images;
  String title;
  String contentType;
  GalleryPageArgs(
      {required this.images, required this.title, required this.contentType});
}

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    final GalleryPageArgs args = Get.arguments;
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Navbar(page: 3),
      appBar: FeatureAppbar(
        title: 'Ruang Info',
        iconSrc: 'assets/icons/icon_info.png',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Text(
              args.title,
              style: heading1BoldTextStyle.copyWith(color: blueColor),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: args.contentType == 'ATTACHMENT'
                    ? ListView.builder(
                        itemCount: args.images.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () {
                              AndroidIntent intent = AndroidIntent(
                                action: 'action_view',
                                data: args.images[index],
                                package: 'com.android.chrome',
                              );

                              intent.launch();
                            },
                            // list view for attachment
                            child: Card(
                              child: Padding(
                                padding: EdgeInsets.all(10.w),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.attach_file,
                                      color: blueColor,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      args.images[index].split('/').last,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }))
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.w,
                          childAspectRatio: 3 / 6,
                        ),
                        itemCount: args.images.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () {
                              // print('tapped : ${_listImage[index]}');
                              showImageViewer(
                                  context,
                                  Image.network(
                                    args.images[index],
                                  ).image,
                                  swipeDismissible: true);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(args.images[index]),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
