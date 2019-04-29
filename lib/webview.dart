import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

class WebView extends StatefulWidget {

  final String title;
  final String url;
  WebView({Key key, this.title, this.url}) : super(key: key);

  @override
  WebViewState createState(){
    return WebViewState(title: title, url: url);
  }
}

class WebViewState extends State<WebView> {
  final String title;
  final String url;
  WebViewState({Key key, this.title, this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(title, style: TextStyle(
                color: Color(0xFF333333)
            )),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Color(0xFFFFFFFF)
        ),
        body: Container(
            child: InAppWebView(
              initialUrl: url,
            )
        )
    );
  }
}