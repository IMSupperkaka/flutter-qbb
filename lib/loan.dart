import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';
class Loan extends StatefulWidget {
  Loan({Key key}) : super(key: key);

  @override
  LoanState createState(){
    return LoanState();
  }
}

class LoanState extends State<Loan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('借款', style: TextStyle(
            color: Color(0xFF333333)
          ))
        ),
        elevation: 0.0,
        backgroundColor: Color(0xFFFFFFFF)
      ),
      body: Container(
        child: InAppWebView(
          initialUrl: "http://loanapi.wanqiandaikuan.com/mobile/xkb/index/loanlist",
        )
      )
    );
  }
}
