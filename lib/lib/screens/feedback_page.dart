import 'package:feedback_driver/service/change_language.dart';
import 'package:feedback_driver/widget/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:feedback_driver/classes/language_constant.dart';
import 'package:feedback_driver/lib/getx/controller.get.dart';
import 'package:feedback_driver/lib/screens/feedback_page/comment_child.dart';
import 'package:feedback_driver/lib/screens/feedback_page/start_child.dart';
import 'package:feedback_driver/lib/screens/result_page.dart';
import 'package:feedback_driver/lib/service/server_api.dart';
import 'package:feedback_driver/utils/mycolors.dart';
import 'package:feedback_driver/utils/padding.dart';
import 'package:feedback_driver/utils/strings.dart';
import 'package:feedback_driver/widget/cusom_input.dart';
import 'package:feedback_driver/widget/custompress.button.dart';
import 'package:feedback_driver/widget/driver_body.dart';
import 'package:feedback_driver/widget/text.dart';

class FeedBackPage extends StatefulWidget {
  String? image, driver;

  FeedBackPage({super.key, required this.image, required this.driver});
  @override
  _FeedBackPageState createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  final TextEditingController controllerInput = TextEditingController(text: '');
  bool isDialogVisible = true;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ServiceAPIs service_api = ServiceAPIs();
  final controllerGetx = Get.put(MyGetXController());
  final _globalKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    changeKeyboardLanguage('ko_KR');
    // changeKeyboardLanguage('zh_CN');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _globalKey,
      resizeToAvoidBottomInset: true,
      persistentFooterButtons: const [],
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: padding32, horizontal: padding64),
          height: height,
          width: width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              filterQuality: FilterQuality.low,
              image: AssetImage('asset/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: width,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 175.0,
                        height: 175.0,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: const [0.1, 0.45, 0.75],
                              colors: [
                                MyColor.white,
                                MyColor.bedge.withOpacity(.75),
                                MyColor.bedge,
                              ],
                            ),
                            border: Border.all(color: MyColor.grey, width: .5),
                            borderRadius: BorderRadius.circular(175)),
                        child: widget.image != null
                            ? loadingImage(
                                networkUrl: widget.image, isCover: true)
                            : const Icon(Icons.person),
                      ),
                      // Positioned(
                      //     top: padding04,
                      //     right: padding04,
                      //     child: IconButton(
                      //       icon: const Icon(Icons.menu_rounded),
                      //       onPressed: () {
                      //         print('click menu');
                      //       },
                      //     )),
                      Positioned(
                          top: padding04,
                          left: padding04,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 42,
                            ),
                            onPressed: () {
                              print('navigator back ');
                              Navigator.of(context).pop();
                              controllerGetx.resetForm();
                            },
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: padding08),
                textcustom(
                    text: widget.driver!.toUpperCase(),
                    size: 30.0,
                    isBold: true,
                    color: MyColor.black_text),
                const SizedBox(
                  height: padding48,
                ),
                textcustom2(
                    text: translation(context).feedback_how_urtrip,
                    size: 18.0,
                    isBold: false,
                    color: MyColor.black_text),
                const SizedBox(
                  height: padding08,
                ),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      starLineItem(
                          index: 1,
                          isActive: controllerGetx.star1.value,
                          onPress: () {
                            controllerGetx.changeStarState(1);
                          }),
                      const SizedBox(
                        width: padding08,
                      ),
                      starLineItem(
                          index: 2,
                          isActive: controllerGetx.star2.value,
                          onPress: () {
                            controllerGetx.changeStarState(2);
                          }),
                      const SizedBox(
                        width: padding08,
                      ),
                      starLineItem(
                          index: 3,
                          isActive: controllerGetx.star3.value,
                          onPress: () {
                            controllerGetx.changeStarState(3);
                          }),
                      const SizedBox(
                        width: padding08,
                      ),
                      starLineItem(
                          index: 4,
                          isActive: controllerGetx.star4.value,
                          onPress: () {
                            controllerGetx.changeStarState(4);
                          }),
                      const SizedBox(
                        width: padding08,
                      ),
                      starLineItem(
                          index: 5,
                          isActive: controllerGetx.star5.value,
                          onPress: () {
                            controllerGetx.changeStarState(5);
                          }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: padding08,
                ),
                Obx(
                  () => textcustom2(
                      text: controllerGetx.starText.value == "GOOD"
                          ? translation(context).feedback_good
                          : controllerGetx.starText.value == "BAD"
                              ? translation(context).feedback_bad
                              : controllerGetx.starText.value == "PERFECT"
                                  ? translation(context).feedback_perfect
                                  : "",
                      size: 18.0,
                      isBold: true,
                      color: MyColor.black_text),
                ),

                //FEEDBACK BODY
                Obx(
                  () => Visibility(
                      visible:
                          controllerGetx.starText.value == '' ? false : true,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: padding72,
                          ),
                          textcustom2(
                              text: translation(context).feedback_enjoy,
                              size: 18.0,
                              isBold: false,
                              color: MyColor.black_text),
                          const SizedBox(
                            height: padding16,
                          ),
                          //COMMENT LIST
                          Obx(
                            () => SizedBox(
                              width: width * 2 / 3,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  commentListChild(
                                      state: controllerGetx.commentstate1.value,
                                      onPress: () {
                                        // print('press comment list child 1');
                                        controllerGetx.changeCommentState(1);
                                        if (controllerGetx
                                                .commentstate1.value ==
                                            true) {}
                                      },
                                      index: 1,
                                      image:
                                          controllerGetx.starText.value == 'BAD'
                                              ? 'asset/image/sad1.png'
                                              : 'asset/image/good1.png',
                                      text:
                                          controllerGetx.starText.value == 'BAD'
                                              ? translation(context)
                                                  .feedback_unhelpful
                                              : translation(context)
                                                  .feedback_helpful),
                                  const SizedBox(
                                    width: padding24,
                                  ),
                                  commentListChild(
                                      onPress: () {
                                        // print('press comment list child 2');

                                        controllerGetx.changeCommentState(2);
                                      },
                                      index: 2,
                                      state: controllerGetx.commentstate2.value,
                                      image:
                                          controllerGetx.starText.value == 'BAD'
                                              ? 'asset/image/sad2.png'
                                              : 'asset/image/good2.png',
                                      text:
                                          controllerGetx.starText.value == 'BAD'
                                              ? translation(context)
                                                  .feedback_unexcellent
                                              : translation(context)
                                                  .feedback_excellent),
                                  const SizedBox(
                                    width: padding24,
                                  ),
                                  commentListChild(
                                      state: controllerGetx.commentstate3.value,
                                      onPress: () {
                                        // print('press comment list child 3');

                                        controllerGetx.changeCommentState(3);
                                        if (controllerGetx.commentstate3 ==
                                            true) {}
                                      },
                                      index: 3,
                                      image: controllerGetx.starText.value ==
                                              'BAD'
                                          ? 'asset/image/sad3.png'
                                          : 'asset/image/good3.png',
                                      text:
                                          controllerGetx.starText.value == 'BAD'
                                              ? translation(context)
                                                  .feedback_unexpert
                                              : translation(context)
                                                  .feedback_expert),
                                  const SizedBox(
                                    width: padding24,
                                  ),
                                  commentListChild(
                                      state: controllerGetx.commentstate4.value,
                                      onPress: () {
                                        // print('press comment list child 4');

                                        controllerGetx.changeCommentState(4);
                                      },
                                      index: 4,
                                      image:
                                          controllerGetx.starText.value == 'BAD'
                                              ? 'asset/image/sad4.png'
                                              : 'asset/image/good4.png',
                                      text: controllerGetx.starText.value ==
                                              'BAD'
                                          ? translation(context).feedback_unwell
                                          : translation(context).feedback_well),
                                ],
                              ),
                            ),
                          ),
                          //COMMENT LIST
                          const SizedBox(
                            height: padding32,
                          ),

                          customInputWlanguage(
                              onTap: () {
                                print('tab input');
                                changeKeyboardLanguage('ko_KR');
                              },
                              width: width * 2 / 3,
                              controller: controllerInput,
                              hint: translation(context).feedback_option_hint),
                          const SizedBox(
                            height: padding48,
                          ),
                          customPressButton(
                              onPress: () {
                                // print('submit');
                                // print('driver: ${widget.driver}');
                                // print('start: ${controllerGetx.starCount.value}');
                                // print('content: ${controllerInput.text}');
                                // print(
                                //     'Experiemce:${checkCommentText().toString()}');
                                // print('status: ${controllerGetx.starCount.value}');

                                service_api.createFeedBack(
                                  driver: '${widget.driver}',
                                  star: '${controllerGetx.starCount.value}',
                                  content: controllerInput.text.isEmpty
                                      ? 'empty'
                                      : controllerInput.text,
                                  experience: checkCommentText(),
                                  status: controllerGetx.starCount.value == 5 ? "PERFECT" : controllerGetx.starCount.value <=2 ? "BAD" : "GOOD",
                                )
                                    .then((value) {
                                  if (value['status'] == true) {
                                    customSnackBar(
                                        context: context,
                                        message: '${value['message']}');
                                    print('feedback id: ${value['data']['id']}');
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => ResultPage(
                                        id_feedback: value['data']['id'],
                                        driver: widget.driver,
                                        rating: controllerGetx.starCount.value,
                                      ),
                                    ));
                                  } else {
                                    customSnackBar(
                                        context: context,
                                        message:'Can not create feedback, please try again or contact developer');
                                  }
                                  print(value['status']);
                                }).whenComplete(() {
                                  print('complete apis create');
                                  controllerGetx.resetForm();
                                });
                              },
                              padding: padding32,
                              width: 165.0,
                              child: Container(
                                alignment: Alignment.center,
                                width: 165.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: MyColor.black_text, width: .5),
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      stops: const [0.1, 0.45, 0.75],
                                      colors: [
                                        MyColor.yellow_gradient1,
                                        MyColor.yellowAccent.withOpacity(.75),
                                        MyColor.yellowAccent,
                                      ],
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(padding32)),
                                child: textcustom(
                                    text: translation(context).feedback_submit,
                                    isBold: true,
                                    size: 22.0),
                              )),
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  checkCommentText() {
    final List<String> messages = [];
    if (controllerGetx.starCount < 3) {
      // print('BAD');
      if (controllerGetx.commentstate1.value == true) {
        messages.add(commentbad1);
      }
      if (controllerGetx.commentstate2.value == true) {
        messages.add(commentbad2);
      }
      if (controllerGetx.commentstate3.value == true) {
        messages.add(commentbad3);
      }
      if (controllerGetx.commentstate4.value == true) {
        messages.add(commentbad4);
      }
    } else {
      // print('GOOD');
      if (controllerGetx.commentstate1.value == true) {
        messages.add(commentgood1);
      }
      if (controllerGetx.commentstate2.value == true) {
        messages.add(commentgood2);
      }
      if (controllerGetx.commentstate3.value == true) {
        messages.add(commentgood3);
      }
      if (controllerGetx.commentstate4.value == true) {
        messages.add(commentgood4);
      }
    }
    return messages;
  }
}
