import 'package:flutter/material.dart';
import 'package:grocery/themes/text_theme.dart';

class CustomInputText extends StatefulWidget {
  const CustomInputText(
      {super.key,
      required this.hintText,
      this.type,
      this.isPassword = false,
      required this.inputController});
  final String hintText;
  final TextInputType? type;
  final bool isPassword;
  final TextEditingController inputController;
  @override
  State<CustomInputText> createState() => _CustomInputTextState();
}

class _CustomInputTextState extends State<CustomInputText> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: MyTextStyle.textStyle(style: const TextStyle()),
      keyboardType: widget.type ?? TextInputType.text,
      obscureText: widget.isPassword,
      controller: widget.inputController,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: MyTextStyle.textStyle(
            style: const TextStyle(color: Color(0xffD6D6D6))),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffD6D6D6))),
        contentPadding: const EdgeInsets.only(left: 2, right: 8, top: 14),
      ),
      cursorColor: Colors.blue[600],
    );
  }
}
