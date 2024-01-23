import 'package:flutter/material.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

class StandardAppBar extends StatelessWidget {
  const StandardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SPAppBar(title: 'Fonctionnalités'),
    );
  }
}
