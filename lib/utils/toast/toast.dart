import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastH{
  static msg(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Color(0xFF63CA6C),
        textColor: Color(0xFFFFFFFF)
    );
  }

  static error(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Color(0xFFED4014),
        textColor: Color(0xFFFFFFFF)
    );
  }
}