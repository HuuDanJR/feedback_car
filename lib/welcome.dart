import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tournament_client/home.dart';
import 'package:tournament_client/lib/models/driver.dart';
import 'package:tournament_client/lib/models/feedback.dart';
import 'package:tournament_client/lib/service/server_api.dart';
import 'package:tournament_client/manage.dart';
import 'package:tournament_client/utils/mycolors.dart';
import 'package:tournament_client/utils/padding.dart';
import 'package:tournament_client/widget/cusom_input.dart';
import 'package:tournament_client/widget/custompress.button.dart';
import 'package:tournament_client/widget/driver_body.dart';
import 'package:tournament_client/widget/listview.dart';
import 'package:tournament_client/widget/shadermask_text.dart';
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
                      text: 'CUSTOMER FEEDBACK ON CAR SERVICE',
                      size: 26,
                      isBold: true,
                      color: MyColor.black_text),
                  textcustom2(
                      text: 'Choose your driver to start giving your feedback',
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
                          title: textcustom(text: 'Manage FB List'),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize
                                .min, // Use min to make the Column only take up the necessary space
                            children: <Widget>[
                              customInput(
                                  controller: controllerUser,
                                  hint: 'Enter user name'),
                              SizedBox(height: padding16),
                              customInput(
                                isPassword: true,
                                  controller: controllerPass,
                                  hint: "Enter password"),

                              // Add more widgets as needed
                            ],
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); // Close the AlertDialog
                              },
                              child: Text('Close'),
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
                              child: Text('Submit'),
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
