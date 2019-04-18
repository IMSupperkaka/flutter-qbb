import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  LoginState createState(){
    return LoginState();
  }
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
                child: Text('登录', style: TextStyle(
                    color: Color(0xFF333333)
                ))
            ),
            elevation: 0.0,
            backgroundColor: Color(0xFFFFFFFF)
        ),
        body: Container()
    );
  }
}