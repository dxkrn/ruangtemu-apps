import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ruang_temu_apps/Widgets/custom_scroll.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';
import 'package:ruang_temu_apps/themes.dart';

class RuangEdukasiDetailArgs {
  String title;
  String image;
  String content;

  RuangEdukasiDetailArgs(
      {required this.title, required this.image, required this.content});
}

class ImageFile {
  String url;

  ImageFile({required this.url});
}

class BlockData {
  final String text;
  final String style;
  final List<String> items;
  String? caption;
  bool? withBorder;
  bool? stretched;
  bool? withBackground;
  ImageFile? file;
  BlockData(
      {required this.text,
      this.style = '',
      required this.items,
      this.caption,
      this.withBorder,
      this.stretched,
      this.withBackground,
      this.file});

  @override
  String toString() {
    return 'BlockData{text: $text, style: $style, items: $items}';
  }
}

class Block {
  final String type;
  final String id;

  final BlockData data;

  Block(this.type, this.id, this.data);
}

class TextContent {
  int time;
  List<Block> blocks;

  TextContent({required this.time, required this.blocks});
}

// a function parse from sanitized html string to string

String deSanitize(String text) {
  return text
      .replaceAll('&amp;', '&')
      .replaceAll('&nbsp;', ' ')
      .replaceAll('&lt;', '<')
      .replaceAll('&gt;', '>')
      .replaceAll('&quot;', '"')
      .replaceAll('&#039;', "'")
      .replaceAll("<br>", "\n")
      .replaceAll("<br/>", "\n")
      .replaceAll("<br />", "\n");
}

TextStyle blackTextFont = const TextStyle(
    fontFamily: 'Poppins', color: Colors.black, fontWeight: FontWeight.w500);

Widget _buildTextContent(TextContent textContent) {
  return Column(
    children: [
      for (var block in textContent.blocks)
        if (block.type == 'header')
          Padding(
            padding: EdgeInsets.only(
                top: 20.h, left: 20.w, right: 20.w, bottom: 10.h),
            child: Text(
              deSanitize(block.data.text),
              style: blackTextFont.copyWith(
                  fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          )
        else if (block.type == 'paragraph')
          Padding(
            padding: EdgeInsets.only(
                top: 10.h, left: 20.w, right: 20.w, bottom: 10.h),
            child: Text(
              deSanitize(block.data.text),
              style: blackTextFont.copyWith(
                  fontSize: 14.sp, fontWeight: FontWeight.w400),
            ),
          )
        else if (block.type == 'list')
          Padding(
            padding: EdgeInsets.only(
                top: 10.h, left: 20.w, right: 20.w, bottom: 10.h),
            child: Column(
              children: [
                for (var item in block.data.items)
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '•',
                          style: blackTextFont.copyWith(
                              fontSize: 14.sp, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Text(
                            deSanitize(item),
                            style: blackTextFont.copyWith(
                                fontSize: 14.sp, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          )
        // else if (block.type == 'image')
        //   Image.network
        else
          Text('$block.type not implemented'),
    ],
  );
}

class RuangEdukasiDetail extends StatelessWidget {
  const RuangEdukasiDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final RuangEdukasiDetailArgs args = Get.arguments;

    dynamic content = jsonDecode(args.content);

    try {
      TextContent contents = TextContent(
          time: content['time'],
          blocks: content['blocks'].map<Block>((block) {
            List<String> items = [];
            if (block['data']['items'] != null) {
              items = block['data']['items'].map<String>((item) {
                return item.toString();
              }).toList();
            }

            return Block(
                block['type'] ?? 'paragraph',
                block['id'],
                BlockData(
                    withBorder: block['data']['withBorder'],
                    withBackground: block['data']['withBackground'],
                    stretched: block['data']['stretched'],
                    caption: block['data']['caption'],
                    file: block['data']['file'] != null
                        ? ImageFile(url: block['data']['file']['url'])
                        : null,
                    text: block['data']['text'] ?? '',
                    style: block['data']['style'] ?? '',
                    items: items));
          }).toList());

      return Scaffold(
        appBar: FeatureAppbar(
            title: 'Artikel', iconSrc: 'assets/icons/icon_edukasi.png'),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          child: ScrollConfiguration(
            behavior: CustomScroll(),
            child: ListView(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  args.title,
                  style: heading1MediumTextStyle.copyWith(
                    color: blueColor,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 180.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    image: DecorationImage(
                      image: NetworkImage(
                        args.image,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                // Text(
                //   args.content,
                //   style: heading2TextStyle.copyWith(
                //     color: blueColor,
                //   ),
                //   textAlign: TextAlign.justify,
                // ),
                _buildTextContent(contents),
                SizedBox(
                  height: 100.h,
                )
              ],
            ),
          ),
        ),
      );
    } catch (e) {
      return Scaffold(
        appBar: FeatureAppbar(
            title: 'Artikel', iconSrc: 'assets/icons/icon_edukasi.png'),
        body: Center(
          child: Text('Error $e'),
        ),
      );
    }
  }
}
