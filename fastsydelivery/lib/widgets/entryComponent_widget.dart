import 'package:flutter/material.dart';

class EntryComponent extends StatefulWidget {
  EntryComponent({Key? key, required this.text, required this.icon, required this.hintText})
      : super(key: key);
  final String text;
  final String hintText;
  final Widget icon;
  @override
  State<EntryComponent> createState() => _EntryComponentState();
}

class _EntryComponentState extends State<EntryComponent> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              widget.text,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            cursorColor: const Color(0xff04764E),
            controller: _textController,
            decoration: InputDecoration(
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
              hintText: widget.hintText,
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                color: const Color(0xffA3A3A3),
                onPressed: () {
                  _textController.clear();
                },
                icon: widget.icon,
              ),
            ),
          )
        ],
      ),
    );
  }
}
