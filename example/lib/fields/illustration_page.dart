import 'package:flutter/material.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

class IllustrationPage extends StatelessWidget {
  const IllustrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SPAppBar(title: 'Illustration'),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SPIllustrationContainer(
              illustration: AppIllustrations.emptyBox,
              label: 'Bienvenue',
            ),
          ],
        ),
      ),
    );
  }
}
