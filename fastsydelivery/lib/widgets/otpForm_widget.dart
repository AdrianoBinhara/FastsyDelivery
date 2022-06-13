import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpForm extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;

  const OtpForm(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      width: 65,
      child: TextFormField(
        autofocus: autoFocus,
        controller: controller,
        textAlignVertical: TextAlignVertical.bottom,
        cursorColor: const Color(0xff04764E),
        cursorWidth: 0,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        onSaved: (pin1) {},
        decoration: const InputDecoration(
          fillColor: Color(0xffF5F5F5),
          filled: true,
          hintText: '0',
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Color(0xff04764E),
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(style: BorderStyle.none),
          ),
        ),
        style: Theme.of(context).textTheme.headline6,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
