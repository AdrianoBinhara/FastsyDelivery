import 'package:flutter/material.dart';

SizedBox backButton_widget(BuildContext context, PageController controller) {
  return SizedBox(
    height: 60,
    width: 154,
    child: TextButton(
      onPressed: () {
        controller.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      },
      style: TextButton.styleFrom(),
      child: Text(
        "Back",
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontWeight: FontWeight.w700, color: Color(0xff000000)),
      ),
    ),
  );
}
