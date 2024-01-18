import 'package:flutter/material.dart';
import 'package:schoolap_pkg/schoolap_pkg.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All button"),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text("Bouton primary"),
            ),
            PrimaryButton(
              title: 'Suivant',
            ),
          ],
        ),
      ),
    );
  }
}
