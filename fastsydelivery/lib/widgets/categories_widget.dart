import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../models/categoryModel.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  final itemController = ItemScrollController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: SizedBox(
        height: 40,
        child: ScrollablePositionedList.builder(
          itemScrollController: itemController,
          scrollDirection: Axis.horizontal,
          itemCount: CategoryItems.all.length,
          itemBuilder: ((context, index) => buildCategory(index)),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          decoration: BoxDecoration(
            color: selectedIndex == index ? Color(0xFF04764E) : Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Text(
                CategoryItems.all[index].title,
                style: TextStyle(
                  color: selectedIndex == index ? Colors.white : Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
