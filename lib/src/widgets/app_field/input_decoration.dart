import 'package:flutter/material.dart';

class SPCustomInputDecoration extends InputDecoration {
  SPCustomInputDecoration({
    Widget? suffixIcon,
    Widget? prefixIcon,
    EdgeInsetsGeometry? contentPadding,
    String? hintText,
    TextStyle? hintStyle,
    InputBorder? border,
  }) : super(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          hintText: hintText,
          hintStyle: hintStyle ??
              const TextStyle(
                fontSize: 13,
                color: Color(0xFFAAAAAA),
                fontFamily: 'Poppins',
              ),
          border: border ?? OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        );
}
