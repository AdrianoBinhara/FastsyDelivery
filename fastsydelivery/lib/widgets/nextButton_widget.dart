import 'package:flutter/material.dart';
import 'package:fastsydelivery/routes/route.dart' as route;

class nextButton_widget extends StatelessWidget {
  const nextButton_widget({
    required this.isEnabled,
    String this.label = "",
    Key? key,
  }) : super(key: key);

  final bool isEnabled;
  final String label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 154,
      child: isEnabled
          ? OutlinedButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, route.loginPage, ModalRoute.withName(route.loginPage)),
              style: ElevatedButton.styleFrom(
                primary: Color(0xff04764E),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(12.0),
                ),
              ),
              child: Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.w700, color: Color(0xffFFFFFF)),
              ),
            )
          : OutlinedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                primary: Color(0xff04764E),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(12.0),
                ),
              ),
              child: Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.w700, color: Color(0xffFFFFFF)),
              ),
            ),
    );
  }
}
