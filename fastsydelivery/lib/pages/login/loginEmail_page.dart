import 'package:fastsydelivery/widgets/descriptionText_widget.dart';
import 'package:fastsydelivery/widgets/entryComponent_widget.dart';
import 'package:fastsydelivery/widgets/iconButton_widget.dart';
import 'package:fastsydelivery/widgets/nextButton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/titleText_widget.dart';

class LoginEmailPage extends StatelessWidget {
  const LoginEmailPage({Key? key}) : super(key: key);

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
                child: TitleText_widget(
                  title: "Welcome Back 👋",
                  align: TextAlign.left,
                ),
              ),
              const SizedBox(
                width: double.infinity,
                child: DescriptionText_widget(
                    description: "Lorem ipsum dolor sit amet", align: TextAlign.left),
              ),
              const SizedBox(
                height: 56,
              ),
              SizedBox(
                height: 86,
                width: double.infinity,
                child: EntryComponent(text: "Email", hintText: "your email"),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 86,
                width: double.infinity,
                child: EntryComponent(text: "Password", hintText: "your password"),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 60,
                width: double.infinity,
                child: ButtonWithIcon(
                  color: 0xff04764E,
                  text: "Login ",
                ),
              ),
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 0.0),
                      child: const DescriptionText_widget(description: "Forgot password?")),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Reset here",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  )
                ],
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 60),
                      child: const DescriptionText_widget(description: "Don’t have an account?"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: const SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: ButtonWithIcon(
                          color: 0xffA3A3A3,
                          text: "Create an account",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
