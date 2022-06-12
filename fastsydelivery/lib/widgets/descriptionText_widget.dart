import 'package:flutter/material.dart';

class DescriptionText_widget extends StatelessWidget {
  const DescriptionText_widget({Key? key, required this.description, this.align = TextAlign.center})
      : super(key: key);

  final String description;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(
        color: Color(0xffA3A3A3),
      ),
      textAlign: align,
    );
  }
}
