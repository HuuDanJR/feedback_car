// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tournament_client/lib/screens/feedback_page/comment_child.dart';
// import 'package:tournament_client/utils/mycolors.dart';
// import 'package:tournament_client/utils/padding.dart';
// import 'package:tournament_client/widget/text.dart';

// Widget commentBody({width,controllerGetx,controllerInput}){
//   return Column(
//     children: [
//       const SizedBox(
//                 height: padding64,
//               ),
//               textcustom2(
//                   text: 'Enjoy the ride?',
//                   size: 18,
//                   isBold: true,
//                   color: MyColor.black_text),
//               const SizedBox(
//                 height: padding16,
//               ),
              
//               //COMMENT LIST
//               Obx(
//                 () => SizedBox(
//                   width: width * 2 / 3,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       commentListChild(
//                           state: controllerGetx.commentstate1.value,
//                           onPress: () {
//                             print('press comment list child 1');
//                             controllerGetx.changeCommentState(1);
//                           },
//                           index: 1,
//                           image: 'asset/image/good1.png',
//                           text: 'Helpful Driver'),
//                       const SizedBox(
//                         width: padding24,
//                       ),
//                       commentListChild(
//                           onPress: () {
//                             controllerGetx.changeCommentState(2);
//                           },
//                           index: 2,
//                           state: controllerGetx.commentstate2.value,
//                           image: 'asset/image/good2.png',
//                           text: 'Excellent Service'),
//                       const SizedBox(
//                         width: padding24,
//                       ),
//                       commentListChild(
//                           state: controllerGetx.commentstate3.value,
//                           onPress: () {
//                             controllerGetx.changeCommentState(3);
//                           },
//                           index: 3,
//                           image: 'asset/image/good3.png',
//                           text: "Expert Navigator"),
//                       const SizedBox(
//                         width: padding24,
//                       ),
//                       commentListChild(
//                           state: controllerGetx.commentstate4.value,
//                           onPress: () {
//                             controllerGetx.changeCommentState(4);
//                           },
//                           index: 4,
//                           image: 'asset/image/good4.png',
//                           text: "Well-Prepared"),
//                     ],
//                   ),
//                 ),
//               ),
//               //COMMENT LIST
//               const SizedBox(
//                 height: padding32,
//               ),
//               SizedBox(
//                 width: width * 2 / 3,
//                 height: 50,
//                 child: TextField(
//                   controller: controllerInput,
//                   decoration: InputDecoration(
//                     hintText: 'Share your experience (Optional)',
//                     enabledBorder: OutlineInputBorder(
//                         borderSide:
//                             BorderSide(color: MyColor.yellow_accent, width: .5),
//                         borderRadius: BorderRadius.circular(padding24)),
//                     focusedBorder: OutlineInputBorder(
//                         borderSide:
//                             BorderSide(color: MyColor.red_accent, width: .5),
//                         borderRadius: BorderRadius.circular(padding24)),
//                     filled: true,
//                     fillColor: MyColor.white.withOpacity(.5),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: padding48,
//               ),
//               customPressButton(
//                   onPress: () {
//                     print('submit');
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (_) => ResultPage(rating: 3)));
//                   },
//                   padding: padding32,
//                   width: 165,
//                   child: Container(
//                     alignment: Alignment.center,
//                     width: 165,
//                     height: 50,
//                     decoration: BoxDecoration(
//                         border:
//                             Border.all(color: MyColor.black_text, width: .5),
//                         gradient: LinearGradient(
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                           stops: [0.1, 0.45, 0.75],
//                           colors: [
//                             MyColor.yellow_gradient1,
//                             MyColor.yellowAccent.withOpacity(.75),
//                             MyColor.yellowAccent,
//                           ],
//                         ),
//                         borderRadius: BorderRadius.circular(padding32)),
//                     child:
//                         textcustom(text: 'submit >>', isBold: true, size: 22),
//                   )),
//     ],
//   )
// }