import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:feedback_driver/classes/language_constant.dart';
import 'package:feedback_driver/lib/getx/controller.get.dart';
import 'package:feedback_driver/lib/service/format.factory.dart';
import 'package:feedback_driver/utils/mycolors.dart';
import 'package:feedback_driver/utils/padding.dart';
import 'package:feedback_driver/welcome.dart';
import 'package:feedback_driver/widget/cusom_input.dart';
import 'package:feedback_driver/widget/custompress.button.dart';
import 'package:feedback_driver/widget/driver_body.dart';
import 'package:feedback_driver/widget/text.dart';

class ResultPage extends StatefulWidget {
  int? rating;
  String? driver;
  String? id_feedback;

  ResultPage({
    super.key,
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

  final _formKey = GlobalKey<FormState>();

  bool isShow = false;
  final controllerFrom = TextEditingController();
  final controllerCustomerName = TextEditingController();
  final controllerMembership = TextEditingController();
  final controllerTo = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    print('star count: ${widget.rating}');
    print('init id feedback from prev: ${widget.id_feedback}');
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
                decoration: BoxDecoration(
                    color: MyColor.grey_tab_opa,
                    border: Border.all(color: MyColor.yellow2, width: 1),
                    borderRadius: BorderRadius.circular(150.0)),
                child: Image.asset(widget.rating! <= 2
                    ? 'asset/image/sad.png'
                    : 'asset/image/love.png'),
              ),
              const SizedBox(height: padding32),
              SizedBox(
                width: width * 2 / 3,
                child: textcustom_center(
                    text: widget.rating! <= 2
                        ? translation(context).result_feedback_bad
                        : translation(context).result_feedback_good,
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
                  child: addMoreInfo(width, _formKey))
            ],
          ),
        ),
      ),
    );
  }

  Widget addMoreInfo(width, key) {
    return Form(
      key: key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Divider(color: MyColor.grey_tab),
          const SizedBox(height: padding16),
          textcustom(text: "Driver Name: ${widget.driver}", size: 18),
          const SizedBox(height: padding08),
          textcustom(
              text:
                  "DateTime: ${formatFactory.formatDateAndTimeFirst(DateTime.now())}",
              size: 18),
          const SizedBox(height: padding08),
          customInput(
              controller: controllerFrom, hint: "From: ", width: width * 2 / 3),
          const SizedBox(height: padding08),
          customInput(
              width: width * 2 / 3, hint: "To: ", controller: controllerTo),
          const SizedBox(
            height: padding08,
          ),
          customInput(
              width: width * 2 / 3,
              hint: "Customer Name: ",
              controller: controllerCustomerName),
          const SizedBox(
            height: padding08,
          ),
          customInput(
              width: width * 2 / 3,
              hint: "Membership #: ",
              controller: controllerMembership),
          // const SizedBox(height: padding08),
          // textcustom(
          //     text: validateInput(
          //         from: controllerFrom.text,
          //         to: controllerTo.text,
          //         name: controllerCustomerName.text,
          //         number: controllerMembership.text)),
          const SizedBox(height: padding32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customPressButton(
                padding: padding32,
                onPress: () {
                  //add more infor about trip
                  // print('id feedback: ${widget.id_feedback}');
                  // print('${controllerFrom.text}');
                  // print('${controllerTo.text}');
                  // print('${controllerCustomerName.text}');
                  // print('${controllerMembership.text}');
                  if (_formKey.currentState!.validate()) {}

                  if (validateInput(
                          from: controllerFrom.text,
                          to: controllerTo.text,
                          name: controllerCustomerName.text,
                          number: controllerMembership.text) ==
                      false) {
                    // showToast('PLEASE FILL ALL INPUT !');
                  } else {
                    print('id feedback from prev page: ${widget.id_feedback}');
                    service_api
                        .updateFeedBack(
                      id: widget.id_feedback,
                      driver: widget.driver,
                      customer_name: controllerCustomerName.text,
                      customer_number: controllerMembership.text,
                      from: controllerFrom.text,
                      to: controllerTo.text,
                    )
                        .then((value) {
                      // showToast('${value['message']}');
                      if (value['status'] == true) {
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (_) => const WelcomePage()));
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => WelcomePage()),
                            (Route<dynamic> route) => false);
                        // Navigator.of(context).pushNamedAndRemoveUntil('/welcome', (Route<dynamic> route) => false);
                      }
                    });
                  }
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
                        stops: const [0.1, 0.45, 0.75],
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
              // SizedBox(
              //   width: padding24,
              // ),
              // customPressButton(
              //   padding: padding32,
              //   onPress: () {
              //     controllerGetx.resetForm();
              //     Navigator.of(context)
              //         .push(MaterialPageRoute(builder: (_) => WelcomePage()));
              //   },
              //   child: Container(
              //     alignment: Alignment.center,
              //     width: 145,
              //     height: 40,
              //     decoration: BoxDecoration(
              //         border: Border.all(color: MyColor.yellowAccent, width: .5),
              //         gradient: LinearGradient(
              //           begin: Alignment.topLeft,
              //           end: Alignment.bottomRight,
              //           stops: [0.1, 0.45, 0.75],
              //           colors: [
              //             MyColor.white,
              //             MyColor.bedge.withOpacity(.75),
              //             MyColor.bedge,
              //           ],
              //         ),
              //         borderRadius: BorderRadius.circular(padding32)),
              //     child: textcustom(text: 'home >>', isBold: true, size: 20),
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}

bool validateInput({String? from, String? to, String? name, String? number}) {
  if (from!.isEmpty || to!.isEmpty || name!.isEmpty || number!.isEmpty) {
    if (from.isEmpty) {
      // return 'Please input pick up place (FROM)';
      return false;
    } else if (to!.isEmpty) {
      // return 'Please input customer destination (TO)';
      return false;
    } else if (name!.isEmpty) {
      // return 'Please input customer name';
      return false;
    } else if (number!.isEmpty) {
      // return 'Please input membership number';
      return false;
    } else {
      return true;
    }
  }
  return true;
}
