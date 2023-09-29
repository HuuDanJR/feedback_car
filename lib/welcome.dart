import 'package:flutter/material.dart';
import 'package:tournament_client/classes/language_constant.dart';
import 'package:tournament_client/lib/service/server_api.dart';
import 'package:tournament_client/main.dart';
import 'package:tournament_client/manage.dart';
import 'package:tournament_client/utils/mycolors.dart';
import 'package:tournament_client/utils/padding.dart';
import 'package:tournament_client/widget/cusom_input.dart';
import 'package:tournament_client/widget/custompress.button.dart';
import 'package:tournament_client/widget/driver_body.dart';
import 'package:tournament_client/widget/text.dart';
import 'package:tournament_client/widget/toast.custom.dart';

class WelcomePage extends StatefulWidget {
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
      body: Stack(
        children: [
          Container(
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
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    width: 100,
                    height: 35,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('asset/image/logo_beige.png'),
                            fit: BoxFit.contain)),
                  ),
                  const SizedBox(height: padding32),
                  textcustom(
                      text: '${translation(context).title}',
                      size: 26,
                      isBold: true,
                      color: MyColor.black_text),
                  // Text(translation(context).personalInformation),
                  textcustom2(
                      text: '${translation(context).subtitle}',
                      size: 18,
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
              right: padding08,
              top: padding08,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                      onTap: () {
                        print('click english');
                        MyApp.setLocale(context,Locale('en'));
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
                        print('click china');
                        MyApp.setLocale(context,Locale(CHINA));
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
                        MyApp.setLocale(context,Locale(KOREA));
                      },
                      child: Image.asset('asset/image/korea.png', scale: 1.75)),
                ],
              )),
          //END FLAG
          Positioned(
              bottom: padding16,
              right: padding16,
              child: customPressButton(
                  child: Icon(Icons.manage_accounts,
                      size: 38, color: MyColor.grey),
                  padding: padding16,
                  onPress: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: textcustom(text: '${translation(context).dialog_manage_title}'),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize
                                .min, // Use min to make the Column only take up the necessary space
                            children: <Widget>[
                              customInput(
                                  controller: controllerUser,
                                  hint: '${translation(context).dialog_manage_username_hint}'),
                              SizedBox(height: padding16),
                              customInput(
                                  isPassword: true,
                                  controller: controllerPass,
                                  hint: "${translation(context).dialog_manage_username_hint}"),

                              // Add more widgets as needed
                            ],
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); // Close the AlertDialog
                              },
                              child: Text('${translation(context).btn_close}'),
                            ),
                            TextButton(
                              onPressed: () {
                                if (controllerUser.text == 'admin' &&
                                    controllerPass.text == 'vegas123') {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => ManagePage()));
                                } else {
                                  showToast('wrong username or password ');
                                  Navigator.of(context).pop();
                                }
                              },
                              child: Text('${translation(context).btn_submit}'),
                            ),
                          ],
                        );
                      },
                    );
                    // Navigator.of(context) .push(MaterialPageRoute(builder: (_) => ManagePage()));
                  }))
        ],
      ),
    );
  }
}
