import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tournament_client/lib/getx/controller.get.dart';
import 'package:tournament_client/lib/service/format.factory.dart';
import 'package:tournament_client/lib/service/server_api.dart';
import 'package:tournament_client/utils/mycolors.dart';
import 'package:tournament_client/utils/padding.dart';
import 'package:tournament_client/utils/strings.dart';
import 'package:tournament_client/welcome.dart';
import 'package:tournament_client/widget/cusom_input.dart';
import 'package:tournament_client/widget/custompress.button.dart';
import 'package:tournament_client/widget/driver_body.dart';
import 'package:tournament_client/widget/shadermask_text.dart';
import 'package:tournament_client/widget/text.dart';
import 'package:tournament_client/widget/toast.custom.dart';

class ResultPage extends StatefulWidget {
  int? rating;
  String? driver;
  String? id_feedback;

  ResultPage({
    required this.rating,
    required this.driver,
    required this.id_feedback,
  });
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final controllerGetx = Get.put(MyGetXController());
  final formatFactory = StringFormat();
  bool isShow = false;
  final controllerFrom = TextEditingController();
  final controllerCustomerName = TextEditingController();
  final controllerMembership = TextEditingController();
  final controllerTo = TextEditingController();
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
        child: SingleChildScrollView(
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
                child: Image.asset(widget.rating! <= 2
                    ? 'asset/image/sad.png'
                    : 'asset/image/love.png'),
                decoration: BoxDecoration(
                    color: MyColor.grey_tab_opa,
                    border: Border.all(color: MyColor.yellow2, width: 1),
                    borderRadius: BorderRadius.circular(150.0)),
              ),
              const SizedBox(height: padding32),
              Container(
                width: width * 2 / 3,
                child: textcustom_center(
                    text: widget.rating! <= 2 ? resultbad : resultgood,
                    size: 18,
                    isBold: false,
                    color: MyColor.black_text),
              ),
              const SizedBox(
                height: padding72,
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isShow = !isShow;
                    });
                  },
                  icon: Icon(
                      isShow == false
                          ? Icons.arrow_downward_outlined
                          : Icons.arrow_upward_outlined,
                      color: MyColor.grey,
                      size: 46)),
              //submit more infor UI
              Visibility(
                  visible: isShow == false ? false : true,
                  child: addMoreInfo(width))
            ],
          ),
        ),
      ),
    );
  }

  Widget addMoreInfo(width) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Divider(color: MyColor.grey_tab),
        const SizedBox(height: padding16),
        textcustom(text: "Driver Name: ${widget.driver}", size: 18),
        const SizedBox(height: padding08),
        textcustom(
            text:
                "DateTime: ${formatFactory.formatDateAndTimeFirst(DateTime.now())}",
            size: 18),
        const SizedBox(height: padding08),
        customInput(
            controller: controllerFrom,
            hint: "FROM: (enter your destination)",
            width: width * 2 / 3),
        const SizedBox(height: padding08),
        customInput(
            width: width * 2 / 3,
            hint: "TO: (enter your destination)",
            controller: controllerTo),
        const SizedBox(
          height: padding08,
        ),
        customInput(
            width: width * 2 / 3,
            hint: "Customer Name: (enter customer name)",
            controller: controllerCustomerName),
        const SizedBox(
          height: padding08,
        ),
        customInput(
            width: width * 2 / 3,
            hint: "Membership #: (enter membership number)",
            controller: controllerMembership),
        const SizedBox(height: padding16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customPressButton(
              padding: padding32,
              onPress: () {
                //add more infor about trip
                print('${controllerFrom.text}');
                print('${controllerTo.text}');
                print('${controllerCustomerName.text}');
                print('${controllerMembership.text}');
                service_api.updateFeedBack(
                      id: widget.id_feedback,
                      driver:widget.driver,
                      customer_name: controllerCustomerName.text,
                      customer_number: controllerMembership.text,
                      from: controllerFrom.text,
                      to:controllerTo.text,
                    )
                    .then((value) {
                      showToast('${value['message']}');
                    });
              },
              child: Container(
                alignment: Alignment.center,
                width: 145,
                height: 40,
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
                child: textcustom(text: 'submit', isBold: true, size: 20),
              ),
            ),
            SizedBox(
              width: padding24,
            ),
            customPressButton(
              padding: padding32,
              onPress: () {
                controllerGetx.resetForm();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => WelcomePage()));
              },
              child: Container(
                alignment: Alignment.center,
                width: 145,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: MyColor.yellowAccent, width: .5),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1, 0.45, 0.75],
                      colors: [
                        MyColor.white,
                        MyColor.bedge.withOpacity(.75),
                        MyColor.bedge,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(padding32)),
                child: textcustom(text: 'home >>', isBold: true, size: 20),
              ),
            ),
          ],
        )
      ],
    );
  }
}
