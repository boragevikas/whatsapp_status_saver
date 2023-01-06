import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebview extends StatelessWidget {
  final String? url;
  final String? title;

  MyWebview({Key? key, this.url, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          title ?? "Terms & Conditions ",
          style: TextStyle(
            fontFamily: 'MuseoSans',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Center(
        child: WebView(
          initialUrl: url ??
              'https://boragevikas.github.io/boragevikas/', //https://www.freeprivacypolicy.com/live/b2b751a2-f178-4121-9fb3-8bab2991bfce
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
