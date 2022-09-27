// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/Models/call_center.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';
import 'package:ruang_temu_apps/env.dart';
import 'package:ruang_temu_apps/themes.dart';
import 'package:http/http.dart' as http;

Future<List<Callcenter>> fetchCallcenter() async {
  final response = await http.get(Uri.parse("$baseAPIUrl/callcenters"));

  if (response.statusCode == 200) {
    Iterable l = json.decode(response.body);
    return List<Callcenter>.from(l.map((model) => Callcenter.fromJson(model)));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load callcenter');
  }
}

class HalounyPage extends StatefulWidget {
  const HalounyPage({super.key});

  @override
  State<HalounyPage> createState() => _HalounyPageState();
}

class _HalounyPageState extends State<HalounyPage> {
  late Future<List<Callcenter>> futureCallcenter;

  @override
  void initState() {
    super.initState();
    futureCallcenter = fetchCallcenter();
  }

  @override
  Widget build(BuildContext context) {
    // double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: FeatureAppbar(
        title: 'HaloUNY!',
        iconSrc: 'assets/icons/icon_phone.png',
      ),
      body: Stack(
        children: [
          Hero(
            tag: 'assets/images/img_ill_halouny.png',
            child: Container(
              height: 200.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/img_ill_halouny.png'),
                ),
              ),
            ),
          ),
          ListView(
            children: [
              Container(
                height: 200.h,
              ),
              Container(
                height: deviceHeight - 200.h,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: blueColor,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: 50.w,
                      height: 2.h,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'HalloUNY! adalah Call Center untuk menerima layanan\naduan mengenai masalah di lingkungan kampus.',
                      style: heading3TextStyle.copyWith(
                        color: whiteColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    FutureBuilder<List<Callcenter>>(
                      future: futureCallcenter,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                              children: snapshot.data
                                      ?.map((e) => CallCenterCard(
                                            imgSrc: e.logoUrl ??
                                                'assets/logos/logo_advokesma.png',
                                            title: e.name,
                                            subtitle: e.description,
                                          ))
                                      .toList() ??
                                  []);
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CallCenterCard extends StatelessWidget {
  CallCenterCard({
    Key? key,
    required this.imgSrc,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  String imgSrc;
  String title;
  String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: 320.w,
          height: 0.375 * 320.w,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 70.w,
                child: Image(
                  image: AssetImage(imgSrc),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: heading1BoldTextStyle.copyWith(
                      color: blueColor,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: heading4TextStyle.copyWith(
                      color: blueColor,
                    ),
                  ),
                ],
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
