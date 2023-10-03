import 'package:feedback_driver/widget/custompress.button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:feedback_driver/lib/models/driver.dart';
import 'package:feedback_driver/lib/screens/feedback_page.dart';
import 'package:feedback_driver/lib/service/server_api.dart';
import 'package:feedback_driver/utils/mycolors.dart';
import 'package:feedback_driver/utils/padding.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:feedback_driver/widget/shadermask_text.dart';
import 'package:feedback_driver/widget/text.dart';

final service_api = ServiceAPIs();
Widget driver_body(width, height) {
  return FutureBuilder(
    future: service_api.fetchDriver(),
    builder: (context, snapshot) {
      final Driver? model = snapshot.data;
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Text('loading...');
      }
      if (snapshot.hasError || snapshot.data == null) {
        return const Text('not found drivers');
      }
      return SizedBox(
        width: width,
        height: height,
        child: GridView.builder(
          itemCount: model!.totalResult,
          itemBuilder: (context, index) {
            return customPressButton(
              padding: padding16,
              onPress: () {
                print('click item $index');
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => FeedBackPage(
                  image:model.data[index].image,
                  driver: model.data[index].name,
                )));
              },
              child:  Container(
                  decoration: BoxDecoration(
                    color: MyColor.white.withOpacity(.75),
                    borderRadius: BorderRadius.circular(padding16),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 150.0,
                          height: 100.0,
                          child: loadingImage(networkUrl:model.data[index].image,isCover: false)),
                        const SizedBox(height: padding04),
                           textcustom(
                            isBold: false,
                            text: model.data[index].name,
                            size: 18.0,
                          ),
                      ]),
                ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              childAspectRatio: .775,
              mainAxisSpacing: padding24,
              crossAxisSpacing: padding24),
        ),
      );
    },
  );
}

Widget loadingImage({String? networkUrl,isCover}) {
  return ClipOval(
    clipBehavior: Clip.hardEdge,
    child: CachedNetworkImage(
      imageUrl: "$networkUrl",
      fit:isCover==true?BoxFit.cover: BoxFit.contain,
      placeholder: (context, url) => Transform.scale(
        scale: .25,
        child: const SpinKitChasingDots(
          color: MyColor.grey,
        ),
      ),
      errorWidget: (context, url, error) => textShaderMask(child: const Icon(Icons.person, color: MyColor.grey)),
    ),
  );
}
