import 'package:flutter/material.dart';

class MtgCardWidget extends StatelessWidget {
  final String name;
  final String ruleText;
  final Image image;

  const MtgCardWidget(
      {super.key,
      required this.name,
      required this.ruleText,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Image(image: image.image),
        Text(name),
        Text(ruleText),
      ]),
    );
  }
}
