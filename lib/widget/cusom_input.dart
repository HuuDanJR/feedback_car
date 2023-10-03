
import 'package:flutter/material.dart';
import 'package:feedback_driver/utils/mycolors.dart';
import 'package:feedback_driver/utils/padding.dart';
Widget customInputWlanguage({double? width, hint,TextEditingController? controller}){
  return SizedBox(
    width: width ,
    height: 50,
    child: TextFormField(
      controller: controller,
      validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Text is empty';
                }
                return null;
              },
      decoration: InputDecoration(
        hintText: '$hint',
        // errorText: validatePassword(controller!.text),
        // errorBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: MyColor.red, width:.5),
        //     borderRadius: BorderRadius.circular(padding24)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: MyColor.yellow_accent, width: .5),
            borderRadius: BorderRadius.circular(padding24)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: MyColor.green, width:1),
            borderRadius: BorderRadius.circular(padding24)),
        filled: true,
        fillColor: MyColor.white.withOpacity(.5),
      ),
    ),
  );
}


Widget customInput({double? width, hint,TextEditingController? controller,isPassword=false}) {
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
        
        // errorText: validatePassword(controller!.text),
        
        // errorBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: MyColor.red, width:.5),
        //     borderRadius: BorderRadius.circular(padding24)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: MyColor.yellow_accent, width: .5),
            borderRadius: BorderRadius.circular(padding24)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: MyColor.green, width:1),
            borderRadius: BorderRadius.circular(padding24)),
        filled: true,
        fillColor: MyColor.white.withOpacity(.5),
      ),
    ),
  );
}

// String? validatePassword(String value) {
//   if (value.isNotEmpty) {
//     return "Input should be not empty";
//   }
//   return null;
// }