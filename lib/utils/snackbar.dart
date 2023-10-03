import 'package:flutter/material.dart';

void showInSnackBar(String value, scaffoldKey) {
  scaffoldKey.currentState
      .showSnackBar(SnackBar(content: Text(value)));
}