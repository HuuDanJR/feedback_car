import 'package:flutter/material.dart';
import 'package:feedback_driver/classes/language_constant.dart';
import 'package:feedback_driver/lib/service/server_api.dart';
import 'package:feedback_driver/main.dart';
import 'package:feedback_driver/manage.dart';
import 'package:feedback_driver/utils/mycolors.dart';
import 'package:feedback_driver/utils/padding.dart';
import 'package:feedback_driver/widget/cusom_input.dart';
import 'package:feedback_driver/widget/custompress.button.dart';
import 'package:feedback_driver/widget/driver_body.dart';
import 'package:feedback_driver/widget/text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final TextEditingController controller = TextEditingController(text: '');
  final TextEditingController controllerUrl = TextEditingController(text: '');
  final TextEditingController controllerUser = TextEditingController(text: '');
  final TextEditingController controllerPass = TextEditingController(text: '');
  bool isDialogVisible = true;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ServiceAPIs service_api = ServiceAPIs();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: padding48, horizontal: padding64),
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
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      width: 150.0,
                      height: 50.0,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('asset/image/logo_beige.png'),
                              fit: BoxFit.contain)),
                    ),
                    const SizedBox(height: padding48),
                    textcustom(
                        text: translation(context).title,
                        size: 26.0,
                        isBold: true,
                        color: MyColor.black_text),
                    // Text(translation(context).personalInformation),
                    textcustom2(
                        text: translation(context).subtitle,
                        size: 18.0,
                        isBold: false,
                        color: MyColor.black_text),
                    const SizedBox(
                      height: padding32,
                    ),
                    driver_body(width, height * .75),
                  ],
                ),
              ),
            ),
            //FLAG
            Positioned(
                right: padding16,
                top: padding16,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                        onTap: () {
                          // print('click english');
                          MyApp.setLocale(context,const Locale('en'));
                        },
                        child: Image.asset(
                          'asset/image/england.png',
                          scale: 1.5,
                        )),
                    const SizedBox(
                      width: padding16,
                    ),
                    GestureDetector(
                        onTap: () async {
                          // print('click china');
                          MyApp.setLocale(context,const Locale(CHINA));
                        },
                        child: Image.asset('asset/image/china.png', scale: 1.5)),
                    const SizedBox(
                      width: padding16,
                    ),
                    // GestureDetector(
                    //     onTap: () {
                    //       print('click japan');
                    //     },
                    //     child: Image.asset('asset/image/japan.png', scale: 1.5)),
                    // const SizedBox(
                    //   width: padding16,
                    // ),
                    GestureDetector(
                        onTap: () {
                          print('click korea');
                          MyApp.setLocale(context,const Locale(KOREA));
                        },
                        child: Image.asset('asset/image/korea.png', scale: 1.75)),
                  ],
                )),
            //END FLAG
            Positioned(
                bottom: padding24,
                right: padding24,
                child: customPressButton(
                    child: const Icon(Icons.manage_accounts,
                        size: 38.0, color: MyColor.grey),
                    padding: padding16,
                    onPress: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: textcustom(text: translation(context).dialog_manage_title),
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize
                                  .min, // Use min to make the Column only take up the necessary space
                              children: <Widget>[
                                customInput(
                                    controller: controllerUser,
                                    hint: translation(context).dialog_manage_username_hint),
                                const SizedBox(height: padding16),
                                customInput(
                                    isPassword: true,
                                    controller: controllerPass,
                                    hint: translation(context).dialog_manage_username_hint),
      
                                // Add more widgets as needed
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the AlertDialog
                                },
                                child: Text(translation(context).btn_close),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (controllerUser.text == 'admin' &&
                                      controllerPass.text == 'vegas123') {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (_) => const ManagePage()));
                                  } else {
                                    // showToast('wrong username or password ');
                                    Navigator.of(context).pop();
                                  }
                                },
                                child: Text(translation(context).btn_submit),
                              ),
                            ],
                          );
                        },
                      );
                      // Navigator.of(context) .push(MaterialPageRoute(builder: (_) => ManagePage()));
                    }))
          ],
        ),
      ),
    );
  }
}
