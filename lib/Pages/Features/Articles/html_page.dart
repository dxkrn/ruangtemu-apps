import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HTMLPageArgs {
  final String html;

  HTMLPageArgs(this.html);
}

class HTMLPage extends StatelessWidget {
  const HTMLPage({super.key});
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as HTMLPageArgs;

    // dom.Document document = htmlparser.parse(createHtmlPage(args.html));
    // parse not supported
    // dom.Document document = htmlparser.parse(args.html);
    /// sanitize or query document here
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informasi'),
      ),
      body: const SingleChildScrollView(
          // child: html,
          ),
    );
  }
}
