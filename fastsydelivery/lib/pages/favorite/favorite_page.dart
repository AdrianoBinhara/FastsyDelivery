import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  final VoidCallback onClicked;
  const FavoritePage({
    Key? key,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
    );
  }
}
