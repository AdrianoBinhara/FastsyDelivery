import 'package:flutter/material.dart';

class TitleText_widget extends StatelessWidget {
  const TitleText_widget({
    Key? key,
    required this.title,
    this.align = TextAlign.center,
  }) : super(key: key);

  final TextAlign align;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: align,
      style: Theme.of(context).textTheme.headline5!.copyWith(
            fontWeight: FontWeight.w700,
          ),
    );
  }
}
