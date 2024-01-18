import 'package:flutter/material.dart';
import 'package:schoolap_pkg/src/widgets/base/app_text.dart';

class PrimaryButton extends StatelessWidget {
  final Color? color;
  final String title;
  final double? height;
  const PrimaryButton(
      {super.key, this.color, required this.title, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 50,
      decoration: ShapeDecoration(
        color: color ?? const Color(0xFFF68C2C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.52),
        ),
      ),
      child: const Center(
        child: AppText.title2(
          'Suivant',
          color: Colors.white,
        ),
      ),
    );
  }
}
