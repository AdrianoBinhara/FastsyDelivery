import 'package:fastsydelivery/models/menuModel.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  final ValueChanged<DrawerItem> onSelectedItem;
  const DrawerPage({
    Key? key,
    required this.onSelectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: Image.asset(
                    'assets/images/Fastsy.png',
                    height: 30,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: DrawerItems.all
                  .map(
                    (element) => ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      onTap: () => onSelectedItem(element),
                      leading: Icon(element.icon, color: const Color(0xFF04764E)),
                      title: Text(
                        element.title,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 40),
              child: Row(
                children: [
                  const RotatedBox(
                      quarterTurns: 2,
                      child: Icon(Icons.logout_outlined, color: Color(0xFF04764E))),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    'Log-Out',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
