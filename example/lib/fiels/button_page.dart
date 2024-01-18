import 'package:flutter/material.dart';
import 'package:schoolap_pkg/schoolap_pkg.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText("All button"),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: AppText.title3("Bouton primary"),
            ),
            PrimaryButton(
              title: 'Suivant',
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: AppText.title3("Bouton primary avec icon gauche"),
            ),
            PrimaryButton(
              title: 'Suivant',
              hasIcon: true,
              iconPosition: IconPosition.left,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: AppText.title3("Bouton primary avec icon droite"),
            ),
            PrimaryButton(
              title: 'Suivant',
              hasIcon: true,
              iconPosition: IconPosition.right,
            ),
            Divider(),
            StatePrimaryButton(
              state: StatePrimaryButtonState.download,
              width: 247,
            ),
            SizedBox(
              height: 10,
            ),
            StatePrimaryButton(
              state: StatePrimaryButtonState.delete,
              width: 247,
            ),
            SizedBox(
              height: 10,
            ),
            StatePrimaryButton(
              state: StatePrimaryButtonState.validation,
              width: 247,
            ),
            Divider(),
            StateSecondaryButton(
              state: StatePrimaryButtonState.download,
              width: 247,
            ),
            SizedBox(
              height: 10,
            ),
            StateSecondaryButton(
              state: StatePrimaryButtonState.delete,
              width: 247,
            ),
            SizedBox(
              height: 10,
            ),
            StateSecondaryButton(
              state: StatePrimaryButtonState.validation,
              width: 247,
            ),
          ],
        ),
      ),
    );
  }
}
