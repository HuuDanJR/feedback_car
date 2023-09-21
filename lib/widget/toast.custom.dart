import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String message) {
  Fluttertoast.showToast(
    webBgColor: "linear-gradient(to right, #ffddb0, #ff8d00 )",
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    webShowClose: true,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
    fontSize: 24.0,
  );
}