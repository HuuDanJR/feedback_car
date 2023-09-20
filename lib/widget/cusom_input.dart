
import 'package:flutter/material.dart';
import 'package:tournament_client/utils/mycolors.dart';
import 'package:tournament_client/utils/padding.dart';

Widget customInput({width, hint, controller,isPassword=false}) {
  return SizedBox(
    width: width ,
    height: 50,
    child: TextField(
      controller: controller,
      obscureText: isPassword==true?true:false,

      decoration: InputDecoration(
        hintText: '$hint',
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColor.yellow_accent, width: .5),
            borderRadius: BorderRadius.circular(padding24)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColor.red_accent, width: .5),
            borderRadius: BorderRadius.circular(padding24)),
        filled: true,
        fillColor: MyColor.white.withOpacity(.5),
      ),
    ),
  );
}