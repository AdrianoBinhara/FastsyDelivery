// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/OnboardModel.dart';
import '../../widgets/backButton_widget.dart';
import '../../widgets/fadein_widget.dart';
import '../../widgets/fadeout_widget.dart';
import '../../widgets/nextButton_widget.dart';
import '../../widgets/onboarding_widget.dart';
import '../../widgets/translationRigt_widget.dart';
import '../../widgets/translationLeft_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;
  bool isLastPage = false;
  bool isFirstPage = true;
  int previousPage = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Column(
            children: [
              SizedBox(
                height: 400,
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      isLastPage = index == 2;
                      isFirstPage = index == 0;
                      previousPage = _pageController.position.userScrollDirection ==
                                  ScrollDirection.forward ||
                              _pageController.position.userScrollDirection == ScrollDirection.idle
                          ? 1
                          : 0;
                    });
                  },
                  itemCount: demo_data.length,
                  controller: _pageController,
                  itemBuilder: (context, index) => Onboardign_widget(
                    image: demo_data[index].image,
                    title: demo_data[index].title,
                    description: demo_data[index].description,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 100),
                child: Center(
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: WormEffect(
                      activeDotColor: Color(0xff04764E),
                      dotColor: Colors.black26,
                      spacing: 16,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: isLastPage
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TranslationLeftWidget(
                            child: Transform.translate(
                              offset: Offset(87.0, 0.0),
                              child: backButton_widget(context, _pageController),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          FadeInWidget(
                            child: nextButton_widget(
                              isEnabled: true,
                              label: "Next",
                            ),
                          ),
                        ],
                      )
                    : isFirstPage
                        ? Container()
                        : previousPage == 1
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TranslationRightWidget(
                                    child: Transform.translate(
                                      offset: Offset(87.0, 0.0),
                                      child: backButton_widget(context, _pageController),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  FadeOutWidget(
                                    child: nextButton_widget(
                                      isEnabled: false,
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FadeInWidget(
                                    child: backButton_widget(context, _pageController),
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
