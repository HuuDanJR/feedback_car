import 'package:feedback_driver/widget/text.dart';
import 'package:flutter/material.dart';

class TEstPage extends StatefulWidget {
  const TEstPage({super.key});

  @override
  State<TEstPage> createState() => _TEstPageState();
}

class _TEstPageState extends State<TEstPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: textcustom(text: "gtefagag"),
    );
  }
}
