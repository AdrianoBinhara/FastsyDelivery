import 'package:flutter/material.dart';
import 'package:fastsydelivery/routes/route.dart' as route;

class DescriptionButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final String description;
  final String routePassed;
  final int color;

  const DescriptionButton(
      {Key? key,
      this.icon,
      this.text = "",
      required this.color,
      required this.description,
      required this.routePassed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 0,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {
            if (routePassed == route.verificationEmailPage) {
              Navigator.pushNamed(context, route.verificationEmailPage);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(0.0),
            height: 70.0,
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: <Widget>[
                LayoutBuilder(builder: (context, constraints) {
                  return Container(
                    width: constraints.maxHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      icon,
                      color: Color(0xffA3A3A3),
                    ),
                  );
                }),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xffA3A3A3),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
