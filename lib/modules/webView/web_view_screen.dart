
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final dynamic articleItem;
  const WebViewScreen({Key? key, required this.articleItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('${articleItem['source']['name']}'),
          centerTitle: true,
        ),
        body: WebView(
          initialUrl: '${articleItem['url']}',
        ),
      ),
    );
  }
}
