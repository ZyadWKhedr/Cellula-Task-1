import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.hintText = "",
    this.isPassword = false,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55, 
      decoration: BoxDecoration(
        color: Colors.black12, // Background color
        borderRadius: BorderRadius.circular(20), 
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _isObscured : false,
        decoration: InputDecoration(
          hintText: widget.hintText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20), 
            borderSide:
                BorderSide.none, 
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                      _isObscured ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
