import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebview extends StatefulWidget {
  const MyWebview({
    Key? key,
  }) : super(key: key);

  @override
  State<MyWebview> createState() => _MyWebviewState();
}

class _MyWebviewState extends State<MyWebview> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: WebView(
        initialUrl: 'https://en.wikipedia.org/wiki/Kraken',
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
