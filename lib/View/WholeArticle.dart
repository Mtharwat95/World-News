import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WholeArticle extends StatelessWidget {
  final String URL;
  WholeArticle(this.URL);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: WebView(
        initialUrl: URL,
      ),
    ));
  }
}
