import 'package:flutter/material.dart';
import 'package:feedback_driver/classes/language_constant.dart';
import 'package:feedback_driver/lib/service/server_api.dart';
import 'package:feedback_driver/utils/mycolors.dart';
import 'package:feedback_driver/utils/padding.dart';
// import 'dart:html' as html;
// import 'dart:js';

import 'package:feedback_driver/widget/manage_body.dart';
import 'package:feedback_driver/widget/text.dart';

class ManagePage extends StatefulWidget {
  const ManagePage({super.key});

  @override
  _ManagePageState createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  final TextEditingController controller = TextEditingController(text: '');
  final TextEditingController controllerUrl = TextEditingController(text: '');
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
    void openUrlInBrowser(String url) {
      // html.window.open(url, 'Download Link');
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          service_api.exportFeedback().then((value) {
            openUrlInBrowser('${BASEURL}download_excel/${value['filePath']}');
          });
        },
        child: const Icon(Icons.download_rounded),
      ),
      body: Container(
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
                  text: translation(context).list_feedback_title,
                  size: 26,
                  isBold: true,
                  color: MyColor.black_text),
              textcustom2(
                  text: translation(context).list_feedback_subtitle,
                  size: 18,
                  isBold: false,
                  color: MyColor.black_text),
              const SizedBox(
                height: padding32,
              ),
              manage_body(width, height * .75),
            ],
          ),
        ),
      ),
    );
  }
}
