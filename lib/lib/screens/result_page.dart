import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tournament_client/lib/getx/controller.get.dart';
import 'package:tournament_client/lib/service/server_api.dart';
import 'package:tournament_client/utils/mycolors.dart';
import 'package:tournament_client/utils/padding.dart';
import 'package:tournament_client/utils/strings.dart';
import 'package:tournament_client/welcome.dart';
import 'package:tournament_client/widget/custompress.button.dart';
import 'package:tournament_client/widget/text.dart';

class ResultPage extends StatefulWidget {
  int? rating;

  ResultPage({
    required this.rating,
  });
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final controllerGetx = Get.put(MyGetXController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
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
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            filterQuality: FilterQuality.low,
            image: AssetImage('asset/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: 
        SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(padding16),
                width: 115.0,
                height: 115.0,
                child: Image.asset(widget.rating!<=2 ?'asset/image/sad.png':'asset/image/love.png'),
                decoration: BoxDecoration(
                    color: MyColor.grey_tab_opa,
                    border: Border.all(color: MyColor.yellow2, width: 1),
                    borderRadius: BorderRadius.circular(150.0)),
              ),
              const SizedBox(height: padding32),
              Container(
                width: width * 2 / 3,
                child: textcustom_center(
                    text:
                      widget.rating!<=2  ?  resultbad:resultgood,
                    size: 18,
                    isBold: false,
                    color: MyColor.black_text),
              ),
              const SizedBox(
                height: padding48,
              ),
              customPressButton(
                padding: padding32,
                onPress: () {
                  controllerGetx.resetForm();
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => WelcomePage()));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 165,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: MyColor.black_text, width: .5),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.1, 0.45, 0.75],
                        colors: [
                          MyColor.yellow_gradient1,
                          MyColor.yellowAccent.withOpacity(.75),
                          MyColor.yellowAccent,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(padding32)),
                  child: textcustom(text: 'home >>', isBold: true, size: 22),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
