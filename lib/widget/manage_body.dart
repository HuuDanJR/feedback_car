import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feedback_driver/lib/models/feedback.dart';
import 'package:feedback_driver/lib/models/trip.dart';
import 'package:feedback_driver/lib/service/format.factory.dart';
import 'package:feedback_driver/lib/service/server_api.dart';
import 'package:feedback_driver/utils/mycolors.dart';
import 'package:feedback_driver/utils/padding.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:feedback_driver/widget/custompress.button.dart';
import 'package:feedback_driver/widget/shadermask_text.dart';
import 'package:feedback_driver/widget/text.dart';

final service_api = ServiceAPIs();
final formatString = StringFormat();
Widget manage_body(width, height) {
  return FutureBuilder(
    future: service_api.fetchFeedBack(),
    builder: (context, snapshot) {
      final FeedBack? model = snapshot.data;
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Text('loading...');
      }
      if (snapshot.hasError || snapshot.data == null) {
        return const Text('not found feedbacks');
      }
      return SizedBox(
        width: width,
        height: height,
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: padding08),
          itemCount: model!.totalResult,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: padding16, vertical: padding08),
              margin: const EdgeInsets.only(bottom: padding16),
              decoration: BoxDecoration(
                border: Border.all(
                    color: model.data[index].star >= 4
                        ? MyColor.green
                        : MyColor.grey_tab),
                color: MyColor.white.withOpacity(.5),
                borderRadius: BorderRadius.circular(padding16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  textcustom(text: '${index + 1}', size: 22, isBold: true),
                  Column(
                    children: [
                      rowIconText(
                          width: width,
                          text: model.data[index].driver,
                          icon: Icons.motorcycle),
                      const SizedBox(
                        height: padding04/2,
                      ),
                      rowIconText(
                          width: width,
                          text: model.data[index].content,
                          icon: Icons.feedback_outlined),
                      const SizedBox(
                        height: padding04/2,
                      ),
                      rowIconText(
                          width: width,
                          color: MyColor.yellow,
                          hasColor: true,
                          text: '${model.data[index].star}',
                          icon: Icons.star),
                      const SizedBox(
                        height: padding04/2,
                      ),
                      rowIconText(
                          width: width,
                          hasColor: false,
                          hasIcon: false,
                          text:
                              removeOuterSquareBrackets(model.data[index].experience.toString()),
                          icon: Icons.emoji_emotions),
                      const Divider(),
                      rowIconText(
                          width: width,
                          hasColor: false,
                          hasIcon: true,
                          text:
                              model.data[index].createdAt,
                          icon: Icons.date_range_outlined),
                    ],
                  ),
                  customPressButton(
                      padding: padding08,
                      onPress: () {
                        // print('click view detail ${model.data[index].datumId}');
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: textcustom(text: 'Additional Info'),
                              content: FutureBuilder(
                                  future: service_api.fetchTripByID(
                                      // '0406139e'
                                      model.data[index].datumId),
                                  builder: (context, snapshot) {
                                    final TripModel? model = snapshot.data;
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Text('loading...');
                                    }
                                    if (snapshot.hasError ||
                                        snapshot.data == null) {
                                      return const Text('not found trip detail');
                                    }
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize
                                          .min, // Use min to make the Column only take up the necessary space
                                      children: <Widget>[
                                        const Divider(),
                                        Text(
                                            'Customer number: ${model!.data.customerNumber}'),
                                        Text(
                                            'Customer name: ${model.data.customerName}'),
                                        const Divider(),
                                        Text('From: ${model.data.from}'),
                                        Text('To: ${model.data.to}'),
                                        const Divider(),
                                        Text(
                                            'Datetime: ${(model.data.createdAt)}'),
                                        // Add more widgets as needed
                                      ],
                                    );
                                  }),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the AlertDialog
                                  },
                                  child: const Text('Close'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 28,
                      ))
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

String removeOuterSquareBrackets(String inputString) {
  if (inputString.startsWith("[") && inputString.endsWith("]")) {
    return inputString.substring(1, inputString.length - 1);
  } else {
    return inputString;
  }
}

Widget rowIconText(
    {icon, text, width, hasColor = false, color, hasIcon = true}) {
  return SizedBox(
    width: width * .7,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        hasIcon == false
            ? Container()
            : Icon(
                icon,
                color: hasColor == true ? color : MyColor.black_text,
              ),
        const SizedBox(
          width: padding04/2,
        ),
        Expanded(
          child: Text(text,
              maxLines: 5,
              softWrap: false,
              style: GoogleFonts.nunitoSans(
                  fontSize: 14, fontWeight: FontWeight.normal)),
        )
      ],
    ),
  );
}

Widget loadingImage({String? networkUrl, isCover}) {
  return ClipOval(
    clipBehavior: Clip.hardEdge,
    child: CachedNetworkImage(
      imageUrl: "$networkUrl",
      fit: isCover == true ? BoxFit.cover : BoxFit.contain,
      placeholder: (context, url) => Transform.scale(
        scale: .25,
        child: const SpinKitChasingDots(
          color: MyColor.grey,
        ),
      ),
      errorWidget: (context, url, error) =>
          textShaderMask(child: const Icon(Icons.person, color: MyColor.grey)),
    ),
  );
}
