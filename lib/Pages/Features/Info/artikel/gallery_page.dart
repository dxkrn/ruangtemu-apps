import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';
import 'package:ruang_temu_apps/Widgets/navbar.dart';
import 'package:ruang_temu_apps/themes.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final List<String> _listImage = [
    'https://bemkmuny.com/wp-content/uploads/2022/07/database-jul-90.png',
    'https://bemkmuny.com/wp-content/uploads/2022/07/database-jul-1.png',
    'https://bemkmuny.com/wp-content/uploads/2022/07/database-jul-2.png',
    'https://bemkmuny.com/wp-content/uploads/2022/07/database-jul-3.png',
    'https://bemkmuny.com/wp-content/uploads/2022/07/database-jul-4.png',
    'https://bemkmuny.com/wp-content/uploads/2022/07/database-jul-5.png',
    'https://bemkmuny.com/wp-content/uploads/2022/07/database-jul-6.png',
    'https://bemkmuny.com/wp-content/uploads/2022/07/database-jul-7.png',
  ];

  @override
  Widget build(BuildContext context) {
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
              'Gallery',
              style: heading1BoldTextStyle.copyWith(color: blueColor),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.w,
                    childAspectRatio: 3 / 6,
                  ),
                  itemCount: _listImage.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        // print('tapped : ${_listImage[index]}');
                        showImageViewer(
                            context,
                            Image.network(
                              _listImage[index],
                            ).image,
                            swipeDismissible: true);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(_listImage[index]),
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
