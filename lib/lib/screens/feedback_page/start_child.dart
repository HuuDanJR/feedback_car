
import 'package:flutter/material.dart';
import 'package:feedback_driver/utils/mycolors.dart';
import 'package:feedback_driver/widget/custompress.button.dart';

Widget starLineItem({int? index, bool? isActive = false, onPress}) {
  return customPressButton(
      padding: 64,
      onPress: () {
        // print('choose $index');
        onPress();
      },
      child: Icon(Icons.star,
          color: isActive == false ? MyColor.white : MyColor.yellowAccent,
          size: 92));
}
