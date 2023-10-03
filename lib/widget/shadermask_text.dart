import 'package:flutter/material.dart';

Widget textShaderMask({child}) {
  return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [
            Color.fromRGBO(173, 120, 44, 1),
            Color.fromRGBO(221, 178, 77, 1),
            Color.fromRGBO(234, 216, 146, 1),
            Color.fromRGBO(234, 204, 126, 1),
            //
            Color.fromRGBO(173, 120, 44, 1),
            Color.fromRGBO(220, 184, 100, 1),
            Color.fromRGBO(206, 189, 118, 1),
            Color.fromRGBO(234, 204, 126, 1),
            //
            Color.fromRGBO(173, 120, 44, 1),
            Color.fromRGBO(220, 184, 100, 1),
            Color.fromRGBO(206, 189, 117, 1),
            Color.fromRGBO(208, 175, 91, 1),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).createShader(bounds);
      },
      child: child);
}
