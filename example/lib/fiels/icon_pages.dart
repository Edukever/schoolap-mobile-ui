import 'package:flutter/material.dart';
import 'package:schoolap_pkg/schoolap_pkg.dart';

class IconPage extends StatelessWidget {
  const IconPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      centerTitle: true,
      title: const AppText.title2("All icon"),
    ));
  }
}
