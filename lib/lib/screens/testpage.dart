import 'package:flutter/material.dart';
import 'package:tournament_client/widget/text.dart';

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
