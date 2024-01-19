import 'package:flutter/material.dart';
import 'package:schoolap_pkg/schoolap_pkg.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SchoolAppText("All button"),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: SchoolAppText.title3("Bouton primary"),
            ),
            SchoolAppPrimaryButton(
              title: 'Suivant',
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: SchoolAppText.title3("Bouton primary avec icon gauche"),
            ),
            SchoolAppPrimaryButton(
              title: 'Suivant',
              hasIcon: true,
              iconPosition: IconPosition.left,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: SchoolAppText.title3("Bouton primary avec icon droite"),
            ),
            SchoolAppPrimaryButton(
              title: 'Suivant',
              hasIcon: true,
              iconPosition: IconPosition.right,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: SchoolAppText.title3("Bouton primary avec outline"),
            ),
            SchoolAppPrimaryButton(
              title: 'Retour',
              hasIcon: true,
              decorationState: DecorationState.outline,
              iconPosition: IconPosition.left,
              iconOrTextColor: Color(0xFFF68C2C),
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
