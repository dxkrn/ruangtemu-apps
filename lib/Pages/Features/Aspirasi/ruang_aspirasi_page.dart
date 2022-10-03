// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/themes.dart';
import 'package:http/http.dart' as http;
import '../../../Models/aspirasi.dart';
import '../../../Widgets/feature_appbar.dart';
import '../../../env.dart';

Future<List<Aspirasi>> fetchSurvey() async {
  final response = await http.get(Uri.parse("$baseAPIUrl/aspirations?page=1"));

  if (response.statusCode == 200) {
    Map<String, dynamic> m = json.decode(response.body);
    Iterable l = m['data'];
    // Iterable l = json.decode(m['data'].toString());
    return List<Aspirasi>.from(l.map((model) => Aspirasi.fromJson(model)));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load survey');
  }
}

class RuangAspirasiPage extends StatefulWidget {
  const RuangAspirasiPage({super.key});

  @override
  State<RuangAspirasiPage> createState() => _RuangAspirasiPageState();
}

class _RuangAspirasiPageState extends State<RuangAspirasiPage> {
  late Future<List<Aspirasi>> futureSurvey;

  @override
  void initState() {
    super.initState();
    futureSurvey = fetchSurvey();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FeatureAppbar(
        title: 'Ruang Aspirasi',
        iconSrc: 'assets/icons/icon_mail.png',
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Stack(
            children: [
              ListView(
                children: [
                  SizedBox(
                    height: 90.h,
                  ),

                  //card builder
                  FutureBuilder<List<Aspirasi>>(
                    future: futureSurvey,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                            children: snapshot.data
                                    ?.map(
                                      (e) => AspirasiCard(
                                        id: e.id,
                                        imgSrc:
                                            'assets/images/img_male_avatar.png',
                                        name: e.user['name'],
                                        content: e.description,
                                        commentCount: e.aspirationCommentsCount,
                                      ),
                                    )
                                    .toList() ??
                                []);
                      } else if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: blueColor,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }

                      // By default, show a loading spinner.
                      return const CircularProgressIndicator(
                        color: Colors.white,
                      );
                    },
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                ],
              ),
              TitleTextBanner(
                title: 'Aspirasi yang telah tertampung',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
  String imgSrc;
  String name;
  String content;
  int commentCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
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
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  imgSrc,
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
                    Container(
                      width: 20.h,
                      height: 20.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icons/icon_comment.png'),
                        ),
                      ),
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

class TitleTextBanner extends StatelessWidget {
  TitleTextBanner({
    Key? key,
    required this.title,
  }) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10.h,
      child: Container(
        alignment: Alignment.center,
        width: 335.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: blueColor,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(
                0,
                2,
              ),
            ),
          ],
        ),
        child: Text(
          title,
          style: heading1MediumTextStyle.copyWith(
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}
