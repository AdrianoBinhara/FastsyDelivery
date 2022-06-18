import 'package:fastsydelivery/models/menuModel.dart';
import 'package:fastsydelivery/pages/favorite/favorite_page.dart';
import 'package:fastsydelivery/pages/home/drawer_page.dart';
import 'package:fastsydelivery/pages/home/homeBody_page.dart';
import 'package:fastsydelivery/pages/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:fastsydelivery/routes/route.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
  DrawerItem item = DrawerItems.home;
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
        return Scaffold(
          bottomNavigationBar: bottonNavigationBar(),
          body: HomeBodyPage(
              onClicked: openDrawer,
              icon: isDrawerOpen ? Icons.arrow_back_ios_rounded : Icons.menu),
        );

      case DrawerItems.favorites:
        return Scaffold(
          bottomNavigationBar: bottonNavigationBar(),
          body: FavoritePage(onClicked: openDrawer),
        );

      default:
        return Scaffold(
          bottomNavigationBar: bottonNavigationBar(),
          body: HomeBodyPage(
              onClicked: openDrawer,
              icon: isDrawerOpen ? Icons.arrow_back_ios_rounded : Icons.menu),
        );
    }
  }
}

class bottonNavigationBar extends StatelessWidget {
  const bottonNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GNav(
            backgroundColor: const Color(0xFF04764E),
            activeColor: Colors.white,
            color: Colors.white.withOpacity(0.7),
            tabBackgroundColor: Colors.white.withOpacity(0.15),
            gap: 5,
            tabMargin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            tabBorderRadius: 20,
            tabs: [
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                borderRadius: BorderRadius.circular(10),
              ),
              GButton(
                icon: Icons.favorite_outline,
                text: 'Favorites',
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                borderRadius: BorderRadius.circular(10),
              ),
              GButton(
                icon: Icons.notifications_outlined,
                text: 'News',
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                borderRadius: BorderRadius.circular(10),
              ),
              GButton(
                icon: Icons.person_outlined,
                text: 'Profile',
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                borderRadius: BorderRadius.circular(10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
