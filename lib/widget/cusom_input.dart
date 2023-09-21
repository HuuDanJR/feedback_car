
import 'package:flutter/material.dart';
import 'package:tournament_client/utils/mycolors.dart';
import 'package:tournament_client/utils/padding.dart';

Widget customInput({width, hint,TextEditingController? controller,isPassword=false}) {
  return SizedBox(
    width: width ,
    height: 50,
    child: TextFormField(
      controller: controller,
      
      obscureText: isPassword==true?true:false,
      validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Text is empty';
                }
                return null;
              },
      decoration: InputDecoration(
        hintText: '$hint',
        
        errorText: validatePassword(controller!.text),
        
        // errorBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: MyColor.red, width:.5),
        //     borderRadius: BorderRadius.circular(padding24)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColor.yellow_accent, width: .5),
            borderRadius: BorderRadius.circular(padding24)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColor.green, width:1),
            borderRadius: BorderRadius.circular(padding24)),
        filled: true,
        fillColor: MyColor.white.withOpacity(.5),
      ),
    ),
  );
}

String? validatePassword(String value) {
  if (!(value.length > 3) && value.isNotEmpty) {
    return "Password should contain more than 3 characters";
  }
  return null;
}