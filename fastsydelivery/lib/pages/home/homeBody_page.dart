import 'package:badges/badges.dart';
import 'package:fastsydelivery/widgets/entryComponent_widget.dart';
import 'package:flutter/material.dart';

class HomeBodyPage extends StatefulWidget {
  final VoidCallback onClicked;
  final IconData icon;
  const HomeBodyPage({
    Key? key,
    required this.icon,
    required this.onClicked,
  }) : super(key: key);

  @override
  State<HomeBodyPage> createState() => _HomeBodyPageState();
}

class _HomeBodyPageState extends State<HomeBodyPage> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    widget.onClicked();
                  },
                  icon: Icon(widget.icon),
                ),
                const SizedBox(width: 10),
                Badge(
                  elevation: 0,
                  position: BadgePosition.topEnd(end: 0, top: -3),
                  badgeColor: const Color(0xFF04764E),
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      'Good Morning',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Kennedy',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22),
              child: TextFormField(
                cursorColor: const Color(0xff04764E),
                controller: _textController,
                decoration: InputDecoration(
                  fillColor: Color(0xFFEBEBEB),
                  filled: true,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff04764E),
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Color(0xffEBEBEB), width: 1.0),
                  ),
                  hintText: 'Search',
                  border: const OutlineInputBorder(),
                  prefixIcon: IconButton(
                      color: const Color(0xffA3A3A3),
                      onPressed: () {
                        _textController.clear();
                      },
                      icon: Icon(Icons.search_outlined)),
                ),
              ),
            )
          ],
        ));
  }
}
