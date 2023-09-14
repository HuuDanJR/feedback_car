import 'package:flutter/material.dart';
import 'package:tournament_client/utils/mycolors.dart';
import 'package:tournament_client/utils/padding.dart';
import 'package:tournament_client/widget/custompress.button.dart';
import 'package:tournament_client/widget/text.dart';

Widget commentListChild(
    {isActive = false, image, text, index, onPress, bool? state}) {
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
            child: Image.asset(
              '$image',
              fit: BoxFit.cover,
            ),
            decoration: BoxDecoration(
              color:state == false ? MyColor.grey_tab_opa : MyColor.yellowAccent,
              borderRadius: BorderRadius.circular(padding16),
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