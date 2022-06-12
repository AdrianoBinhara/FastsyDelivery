import 'package:fastsydelivery/widgets/titleText_widget.dart';
import 'package:flutter/material.dart';

import 'descriptionText_widget.dart';

class Onboardign_widget extends StatelessWidget {
  const Onboardign_widget({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 250,
        ),
        TitleText_widget(title: title),
        SizedBox(
          height: 10,
        ),
        DescriptionText_widget(description: description),
      ],
    );
  }
}
