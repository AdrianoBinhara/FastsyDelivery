import 'package:fastsydelivery/pages/login/forgotPass_page.dart';
import 'package:fastsydelivery/pages/login/loginEmail_page.dart';
import 'package:fastsydelivery/pages/login/login_page.dart';
import 'package:fastsydelivery/pages/onboarding/onboarding_page.dart';
import 'package:fastsydelivery/widgets/entryComponent_widget.dart';
import 'package:flutter/material.dart';

import '../pages/login/verificationEmail_page.dart';

const String loginPage = 'login';
const String onboardingPage = 'onboarding';
const String loginEmailPage = 'loginEmail';
const String forgotPassPage = 'forgotPass';
const String verificationEmailPage = 'verificationEmailPage';

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

      default:
        throw Exception('A rota ${settings.name} não existe!');
    }
  }
}
