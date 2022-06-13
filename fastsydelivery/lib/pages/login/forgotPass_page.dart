import 'package:fastsydelivery/widgets/DescriptionButton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fastsydelivery/routes/route.dart' as route;

import '../../widgets/descriptionText_widget.dart';
import '../../widgets/iconButton_widget.dart';
import '../../widgets/titleText_widget.dart';

class ForgotPassPage extends StatefulWidget {
  const ForgotPassPage({Key? key}) : super(key: key);

  @override
  State<ForgotPassPage> createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
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
            children: const [
              SizedBox(
                width: double.infinity,
                child: TitleText_widget(
                  title: "Forgot Password",
                  align: TextAlign.left,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: DescriptionText_widget(
                    description:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit",
                    align: TextAlign.left),
              ),
              SizedBox(
                height: 56,
              ),
              SizedBox(
                child: DescriptionButton(
                  description: 'Send to your email',
                  color: 0xff04764E,
                  routePassed: route.verificationEmailPage,
                  icon: Icons.email_outlined,
                  text: "Email",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: DescriptionButton(
                  description: 'Send to your phone number',
                  color: 0xff04764E,
                  routePassed: route.verificationEmailPage,
                  icon: Icons.phone_outlined,
                  text: "Phone Number",
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ButtonWithIcon(
                  color: 0xff04764E,
                  text: "Continue ",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
