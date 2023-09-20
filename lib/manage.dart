import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tournament_client/home.dart';
import 'package:tournament_client/lib/models/driver.dart';
import 'package:tournament_client/lib/models/feedback.dart';
import 'package:tournament_client/lib/service/server_api.dart';
import 'package:tournament_client/utils/mycolors.dart';
import 'package:tournament_client/utils/padding.dart';
import 'package:tournament_client/widget/custompress.button.dart';
import 'package:tournament_client/widget/driver_body.dart';
import 'package:tournament_client/widget/listview.dart';
import 'package:tournament_client/widget/manage_body.dart';
import 'package:tournament_client/widget/shadermask_text.dart';
import 'package:tournament_client/widget/text.dart';

class ManagePage extends StatefulWidget {
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

    return Scaffold(
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
                    text: 'CUSTOMER FEEDBACK LIST',
                    size: 26,
                    isBold: true,
                    color: MyColor.black_text),
              textcustom2(
                  text: 'all list of customer feedback from driver team',
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
