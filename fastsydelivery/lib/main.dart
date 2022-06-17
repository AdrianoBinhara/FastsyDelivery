import 'package:fastsydelivery/models/menuModel.dart';
import 'package:fastsydelivery/pages/favorite/favorite_page.dart';
import 'package:fastsydelivery/pages/home/drawer_page.dart';
import 'package:fastsydelivery/pages/home/homeBody_page.dart';
import 'package:fastsydelivery/pages/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:fastsydelivery/routes/route.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    onGenerateRoute: RouteGenerator.generateRoute,
    initialRoute: "onboarding",
    home: const OnboardingPage(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DrawerItem item = DrawerItems.favorites;
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDragging = false;
  bool isDrawerOpen = false;

  void openDrawer() => setState(() {
        xOffset = 330;
        yOffset = 200;
        scaleFactor = 0.7;
        isDrawerOpen = true;
      });

  void closeDrawer() => setState(() {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
        isDrawerOpen = false;
      });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerPage(
            onSelectedItem: (item) {
              setState(() => this.item = item);
              closeDrawer();
            },
          ),
          WillPopScope(
            onWillPop: () async {
              if (isDrawerOpen) {
                closeDrawer();

                return false;
              } else {
                return true;
              }
            },
            child: GestureDetector(
              onHorizontalDragStart: (details) => isDragging = true,
              onHorizontalDragUpdate: (details) {
                if (!isDragging) return;

                const delta = 1;
                if (details.delta.dx > delta) {
                  openDrawer();
                } else if (details.delta.dx < -delta) {
                  closeDrawer();
                }

                isDragging = false;
              },
              onTap: isDrawerOpen ? closeDrawer : null,
              child: AnimatedContainer(
                transform: Matrix4.translationValues(xOffset, yOffset, 0)
                  ..scale(
                    scaleFactor,
                  )
                  ..rotateY(isDrawerOpen ? -0.5 : 0.0),
                duration: const Duration(milliseconds: 550),
                curve: Curves.fastLinearToSlowEaseIn,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.15),
                      spreadRadius: 10,
                      blurRadius: 80,
                      offset: const Offset(0, 20),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(isDrawerOpen ? 20 : 0),
                  color: Colors.white,
                ),
                child: AbsorbPointer(absorbing: isDrawerOpen, child: getDrawerPage()),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getDrawerPage() {
    switch (item) {
      case DrawerItems.home:
        return HomeBodyPage(
            onClicked: openDrawer, icon: isDrawerOpen ? Icons.arrow_back_ios_rounded : Icons.menu);

      case DrawerItems.favorites:
        return FavoritePage(onClicked: openDrawer);

      default:
        return HomeBodyPage(
            onClicked: openDrawer, icon: isDrawerOpen ? Icons.arrow_back_ios_rounded : Icons.menu);
    }
  }
}
