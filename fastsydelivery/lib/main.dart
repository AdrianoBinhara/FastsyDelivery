import 'package:fastsydelivery/pages/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:fastsydelivery/routes/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: "onboarding",
      home: const OnboardingPage(),
    );
  }
}
