import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final bool isSMS;
  final Color cursorColor;

  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText = '',
    required this.prefixIcon,
    required this.isSMS,
    required this.cursorColor,
  });

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: widget.cursorColor,
      decoration: InputDecoration(
        hintText: widget.isSMS
            ? "Please enter your mobile number"
            : "Please enter your email",
        hintStyle: const TextStyle(
          fontFamily: "FontMain",
          color: Colors.grey, // Change to your preferred color
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue, // Change to your preferred color
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue, // Change to your preferred color
          ),
        ),
        prefixIcon: Icon(widget.prefixIcon),
        filled: true,
        fillColor: Colors.white, // Change to your preferred color
      ),
    );
  }
}
