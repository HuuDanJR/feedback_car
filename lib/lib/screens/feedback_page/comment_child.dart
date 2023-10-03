import 'package:flutter/material.dart';
import 'package:feedback_driver/utils/mycolors.dart';
import 'package:feedback_driver/utils/padding.dart';
import 'package:feedback_driver/widget/custompress.button.dart';
import 'package:feedback_driver/widget/text.dart';

Widget commentListChild(
    {isActive = false, image, text,int? index, onPress, bool? state}) {
  return Column(
    children: [
      customPressButton(
        onPress: () {
          onPress();
        },
        padding: padding16,
        child: Container(
            alignment: Alignment.center,
            width: 85,
            height: 90,
            padding: const EdgeInsets.all(padding16),
            decoration: BoxDecoration(
              color:state == false ? MyColor.grey_tab_opa : MyColor.yellowAccent,
              borderRadius: BorderRadius.circular(padding16),
            ),
            child: Image.asset(
              '$image',
              fit: BoxFit.cover,
            )),
      ),
      const SizedBox(
        height: padding08,
      ),
      textcustom2(
          text: '$text', size: 16, isBold: false, color: MyColor.black_text),
    ],
  );
}