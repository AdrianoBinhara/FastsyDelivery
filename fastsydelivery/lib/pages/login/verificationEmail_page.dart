import 'package:fastsydelivery/widgets/otpForm_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/descriptionText_widget.dart';
import '../../widgets/iconButton_widget.dart';
import '../../widgets/titleText_widget.dart';

class VerficationEmailPage extends StatefulWidget {
  const VerficationEmailPage({Key? key}) : super(key: key);

  @override
  State<VerficationEmailPage> createState() => _VerficationEmailPageState();
}

class _VerficationEmailPageState extends State<VerficationEmailPage> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  String? _otp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset("assets/images/Vectorchevron.svg")),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xff090A09)),
        shadowColor: Colors.transparent,
        title: const Text(
          '',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 22, right: 22),
          child: ListView(
            children: [
              const SizedBox(
                width: double.infinity,
                child: TitleText_widget(title: "Verification Email", align: TextAlign.center),
              ),
              const SizedBox(
                height: 12,
              ),
              const SizedBox(
                child: Text.rich(
                  TextSpan(
                    text: 'Lorem ipsum dolor sit amet, consectetur\n',
                    style: TextStyle(
                      color: Color(0xffA3A3A3),
                    ),
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'your@email.com',
                        style: TextStyle(
                            fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OtpForm(_fieldOne, true),
                  OtpForm(_fieldTwo, false),
                  OtpForm(_fieldThree, false),
                  OtpForm(_fieldFour, false)
                ],
              ),
              SizedBox(height: 25),
              const Text.rich(
                TextSpan(
                  text: 'Lorem ipsum dolor sit amet?',
                  style: TextStyle(
                    color: Color(0xffA3A3A3),
                  ),
                  children: <InlineSpan>[
                    TextSpan(
                      text: ' resend',
                      style:
                          TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 70),
              const SizedBox(
                height: 60,
                width: double.infinity,
                child: ButtonWithIcon(
                  color: 0xff04764E,
                  text: "Continue ",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
