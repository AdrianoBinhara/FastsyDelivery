import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  final IconData? icon;
  final String text;
  final int color;

  const ButtonWithIcon({Key? key, this.icon, this.text = "", required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return icon != null
        ? OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            label: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              primary: Color(color),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          )
        : OutlinedButton(
            onPressed: () {},
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              primary: Color(color),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          );
  }
}
