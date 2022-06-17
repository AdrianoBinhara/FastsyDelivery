import 'package:flutter/material.dart';
import 'package:fastsydelivery/routes/route.dart' as route;
import 'package:flutter_svg/svg.dart';
import '../../widgets/descriptionText_widget.dart';
import '../../widgets/entryComponent_widget.dart';
import '../../widgets/iconButton_widget.dart';
import '../../widgets/titleText_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                  title: "Sign Up",
                  align: TextAlign.left,
                ),
              ),
              SizedBox(height: 10),
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
                child: EntryComponent(
                  text: "Name",
                  hintText: "your name",
                  icon: const Icon(Icons.clear),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 86,
                width: double.infinity,
                child: EntryComponent(
                  text: "Email",
                  hintText: "your email",
                  icon: const Icon(Icons.clear),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 86,
                width: double.infinity,
                child: EntryComponent(
                  text: "Password",
                  hintText: "your password",
                  icon: const Icon(Icons.remove_red_eye),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                height: 60,
                width: double.infinity,
                child: ButtonWithIcon(
                  route: route.donePage,
                  color: 0xff04764E,
                  text: "Register",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text.rich(
                      TextSpan(
                        text: 'By tapping “Register” you accept our',
                        style: TextStyle(
                          color: Color(0xffA3A3A3),
                        ),
                        children: <InlineSpan>[
                          TextSpan(
                            text: ' terms \n and condition',
                            style: TextStyle(
                                fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      textAlign: TextAlign.center,
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
