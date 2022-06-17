import 'package:fastsydelivery/main.dart';
import 'package:fastsydelivery/pages/login/forgotPass_page.dart';
import 'package:fastsydelivery/pages/login/loginEmail_page.dart';
import 'package:fastsydelivery/pages/login/login_page.dart';
import 'package:fastsydelivery/pages/onboarding/onboarding_page.dart';
import 'package:fastsydelivery/pages/signup/done_page.dart';
import 'package:fastsydelivery/pages/signup/signup_page.dart';
import 'package:flutter/material.dart';

import '../pages/login/verificationEmail_page.dart';

const String loginPage = 'login';
const String onboardingPage = 'onboarding';
const String loginEmailPage = 'loginEmail';
const String forgotPassPage = 'forgotPass';
const String verificationEmailPage = 'verificationEmailPage';
const String signUpPage = 'signUpPage';
const String donePage = 'donePage';
const String homePage = 'homePage';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(builder: (context) => const LoginPage());

      case onboardingPage:
        return MaterialPageRoute(builder: (context) => const OnboardingPage());

      case loginEmailPage:
        return MaterialPageRoute(builder: (context) => const LoginEmailPage());

      case forgotPassPage:
        return MaterialPageRoute(builder: (context) => const ForgotPassPage());

      case verificationEmailPage:
        return MaterialPageRoute(builder: (context) => const VerficationEmailPage());

      case signUpPage:
        return MaterialPageRoute(builder: (context) => const SignUpPage());

      case donePage:
        return MaterialPageRoute(builder: (context) => const DonePage());

      case homePage:
        return MaterialPageRoute(builder: (context) => MyApp());
      default:
        throw Exception('A rota ${settings.name} não existe!');
    }
  }
}
