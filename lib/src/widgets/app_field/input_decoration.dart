import 'package:flutter/material.dart';

class SPCustomInputDecoration extends InputDecoration {
  SPCustomInputDecoration({
    super.suffixIcon,
    super.prefixIcon,
    EdgeInsetsGeometry? contentPadding,
    String? hintText,
    TextStyle? hintStyle,
    InputBorder? border,
    Color? backgroundColor,
    InputBorder? errorBorder,
    InputBorder? disabledBorder,
    super.isDense,
  }) : super(
          fillColor: backgroundColor,
          filled: backgroundColor != null,
          contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
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
