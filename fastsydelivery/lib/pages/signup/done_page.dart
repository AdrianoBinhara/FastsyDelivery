import 'package:fastsydelivery/widgets/descriptionText_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/iconButton_widget.dart';

class DonePage extends StatefulWidget {
  const DonePage({Key? key}) : super(key: key);

  @override
  State<DonePage> createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 22, right: 22),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 250,
                  child: Lottie.asset(
                    'assets/json/done.json',
                  ),
                ),
                const Text(
                  'Congratulations!',
                  style: TextStyle(
                      color: Color(
                        0xff04764E,
                      ),
                      fontWeight: FontWeight.w700,
                      fontSize: 24),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: DescriptionText_widget(
                    description: 'Lorem ipsum dolor sit amet, consectetur\n adipiscing elit',
                  ),
                ),
                const SizedBox(height: 47),
                const SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ButtonWithIcon(
                    color: 0xff04764E,
                    text: "Get Started",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
