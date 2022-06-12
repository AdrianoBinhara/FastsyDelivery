import 'package:fastsydelivery/pages/login/loginEmail_page.dart';
import 'package:fastsydelivery/pages/login/login_page.dart';
import 'package:fastsydelivery/pages/onboarding/onboarding_page.dart';
import 'package:fastsydelivery/widgets/entryComponent_widget.dart';
import 'package:flutter/material.dart';

const String loginPage = 'login';
const String onboardingPage = 'onboarding';
const String loginEmailPage = 'loginEmail';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(builder: (context) => const LoginPage());

      case onboardingPage:
        return MaterialPageRoute(builder: (context) => const OnboardingPage());

      case loginEmailPage:
        return MaterialPageRoute(builder: (context) => const LoginEmailPage());

      default:
        throw Exception('A rota ${settings.name} não existe!');
    }
  }
}
