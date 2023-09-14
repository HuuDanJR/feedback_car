import 'package:flutter/material.dart';

void showInSnackBar(String value, _scaffoldKey) {
  _scaffoldKey.currentState
      .showSnackBar(new SnackBar(content: new Text(value)));
}