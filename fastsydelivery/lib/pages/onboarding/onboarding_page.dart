// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FadeInWidget extends StatefulWidget {
  final Widget child;

  FadeInWidget({required this.child});

  @override
  State<FadeInWidget> createState() => _FadeInWidgetState();
}

class _FadeInWidgetState extends State<FadeInWidget> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward(from: 0.0);
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}

class TranslationWidget extends StatefulWidget {
  final Widget child;

  const TranslationWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<TranslationWidget> createState() => _TranslationWidgetState();
}

class _TranslationWidgetState extends State<TranslationWidget> with TickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> translationAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    translationAnimation = Tween(
      begin: 0.0,
      end: -87.0,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward(from: 0.0);
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(translationAnimation.value, 0.0),
          child: widget.child,
        );
      },
    );
  }
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;
  bool isLastPage = false;
  bool isFirstPage = true;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
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
                    });
                  },
                  itemCount: demo_data.length,
                  controller: _pageController,
                  itemBuilder: (context, index) => OnboardignComponent(
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
                          TranslationWidget(
                            child: Transform.translate(
                              offset: Offset(87.0, 0.0),
                              child: SizedBox(
                                height: 60,
                                width: 154,
                                child: TextButton(
                                  onPressed: () {
                                    _pageController.previousPage(
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.ease,
                                    );
                                  },
                                  style: TextButton.styleFrom(),
                                  child: Text(
                                    "Back",
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        fontWeight: FontWeight.w700, color: Color(0xff000000)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          FadeInWidget(
                            child: SizedBox(
                              height: 60,
                              width: 154,
                              child: OutlinedButton(
                                  onPressed: () {
                                    _pageController.nextPage(
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.ease,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xff04764E),
                                    shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(12.0),
                                    ),
                                  ),
                                  child: Text(
                                    "Next",
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        fontWeight: FontWeight.w700, color: Color(0xffFFFFFF)),
                                  )),
                            ),
                          ),
                        ],
                      )
                    : isFirstPage
                        ? Container()
                        : FadeInWidget(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 60,
                                  width: 154,
                                  child: TextButton(
                                    onPressed: () {
                                      _pageController.previousPage(
                                        duration: const Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    style: TextButton.styleFrom(),
                                    child: Text(
                                      "Back",
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                          fontWeight: FontWeight.w700, color: Color(0xff000000)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Onboard> demo_data = [
  Onboard(
    image: "assets/images/map.png",
    title: "Come visit our\n stores",
    description: "Lorem ipsum dolor sit amet,\n consectetur adipiscing elit",
  ),
  Onboard(
    image: "assets/images/map.png",
    title: "Come visit our\n stores",
    description: "Lorem ipsum dolor sit amet,\n consectetur adipiscing elit",
  ),
  Onboard(
    image: "assets/images/map.png",
    title: "Come visit our\n stores",
    description: "Lorem ipsum dolor sit amet,\n consectetur adipiscing elit",
  ),
];

class OnboardignComponent extends StatelessWidget {
  const OnboardignComponent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 250,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5!.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          description,
          style: TextStyle(
            color: Color(0xffA3A3A3),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
