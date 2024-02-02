import 'package:flutter/material.dart';

class CustomInputText extends StatefulWidget {
  const CustomInputText(
      {super.key, required this.hintText, this.type, this.isPassword = false});
  final String hintText;
  final TextInputType? type;
  final bool isPassword;
  @override
  State<CustomInputText> createState() => _CustomInputTextState();
}

class _CustomInputTextState extends State<CustomInputText> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.type ?? TextInputType.text,
      obscureText: widget.isPassword,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Color(0xffD6D6D6)),
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
