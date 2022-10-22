// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ruang_temu_apps/Pages/Features/Aspirasi/ruang_aspirasi_comment_page.dart';
import 'package:ruang_temu_apps/Widgets/aspirasi_card.dart';
import 'package:ruang_temu_apps/Widgets/custom_scroll.dart';
import 'package:ruang_temu_apps/Widgets/feature_appbar.dart';
import 'package:ruang_temu_apps/env.dart';
import 'package:ruang_temu_apps/http_client.dart';
import 'package:ruang_temu_apps/themes.dart';
import 'package:ruang_temu_apps/Models/aspirasi.dart';
import 'package:get/get.dart';

class RuangAspirasiPage extends StatefulWidget {
  const RuangAspirasiPage({super.key});

  @override
  State<RuangAspirasiPage> createState() => _RuangAspirasiPageState();
}

class _RuangAspirasiPageState extends State<RuangAspirasiPage> {
  late Future<List<Aspirasi>> futureSurvey;
  late ScrollController _controller;

  int _page = 1;
  final int _limit = 10;
  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;
  List _posts = [];

  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    // print("$baseAPIUrl/aspirations?page=$_page&limit=$_limit");
    final res = await httpClient
        .get("$baseAPIUrl/aspirations?page=$_page&limit=$_limit");

    if (res.statusCode == 200) {
      // print(res.body);
      setState(() {
        Map<String, dynamic> m = json.decode(res.body);

        Iterable l = m['data'];
        _posts =
            List<Aspirasi>.from(l.map((model) => Aspirasi.fromJson(model)));
      });
    } else {
      throw Exception('Failed to load survey on first');
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
        _page++; // Increase _page by 1
      });
      final res = await httpClient
          .get("$baseAPIUrl/aspirations?page=$_page&limit=$_limit");

      if (res.statusCode == 200) {
        Map<String, dynamic> m = json.decode(res.body);
        String? nextPageUrl = m['next_page_url'];

        setState(() {
          _hasNextPage = nextPageUrl != null;
        });

        Iterable l = m['data'];
        final List fetchedPosts =
            List<Aspirasi>.from(l.map((model) => Aspirasi.fromJson(model)));
        if (fetchedPosts.isNotEmpty) {
          setState(() {
            _posts.addAll(fetchedPosts);
          });
        } else {
          // This means there is no more data
          // and therefore, we will not send another GET request
          setState(() {
            _hasNextPage = false;
          });
        }
      } else {
        throw Exception('Failed to load survey on next');
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FeatureAppbar(
        title: 'Ruang Aspirasi',
        iconSrc: 'assets/icons/icon_mail.png',
      ),
      body: _isFirstLoadRunning
          ? const Center(
              child: CircularProgressIndicator(color: Color(0xff18345C)))
          : Column(
              children: [
                Expanded(
                  child: ScrollConfiguration(
                    behavior: CustomScroll(),
                    child: ListView.builder(
                      controller: _controller,
                      itemCount: _posts.length,
                      itemBuilder: ((_, index) => AspirasiCard(
                            id: _posts[index].id,
                            imgSrc: _posts[index].user['avatar'] ??
                                'assets/images/img_male_avatar.png',
                            name: _posts[index].user['name'],
                            content: _posts[index].message,
                            commentCount: _posts[index].aspirationCommentsCount,
                          )),
                    ),
                  ),
                ),
                if (_isLoadMoreRunning == true)
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 40),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff18345C),
                      ),
                    ),
                  ),
                if (_hasNextPage == false)
                  Container(
                    padding: const EdgeInsets.only(top: 30, bottom: 40),
                    color: Colors.amber,
                    child: const Center(
                      child: Text('You have fetched all of the content'),
                    ),
                  ),
              ],
            ),
    );
  }
}

//unused Widget, for title
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
