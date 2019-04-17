import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: new Text('首页', style: new TextStyle(
            color: Color(0xFF333333)
          ))
        ),
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0.0
      ),
      body: Center(
        child: new ListView(
          children: [

          ]
        )
      )
    );
  }
}