import 'package:flutter/material.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SPText("All button"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: SPText.title3("Bouton primary"),
            ),
            const SPButtonPrimary(
              title: 'Suivant',
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: SPText.title3("Bouton primary avec icon gauche"),
            ),
            SPButtonPrimary(
              title: 'Suivant',
              iconPosition: IconPosition.left,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: SPText.title3("Bouton primary avec icon droite"),
            ),
            SPButtonPrimary(
              title: 'Suivant',
              iconPosition: IconPosition.right,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: SPText.title3("Bouton primary avec outline"),
            ),
            SPButtonPrimary(
              title: 'Retour',
              decorationState: DecorationState.outline,
              iconPosition: IconPosition.left,
              iconOrTextColor: const Color(0xFFF68C2C),
            ),
            const Divider(),
            const SPButtonStatePrimary(
              state: SPButtonStatePrimaryState.download,
              width: 247,
            ),
            const SizedBox(
              height: 10,
            ),
            const SPButtonStatePrimary(
              state: SPButtonStatePrimaryState.delete,
              width: 247,
            ),
            const SizedBox(
              height: 10,
            ),
            const SPButtonStatePrimary(
              state: SPButtonStatePrimaryState.validation,
              width: 247,
            ),
            const Divider(),
            const SPButtonSecondaryState(
              state: SPButtonStatePrimaryState.download,
              width: 247,
            ),
            const SizedBox(
              height: 10,
            ),
            const SPButtonSecondaryState(
              state: SPButtonStatePrimaryState.delete,
              width: 247,
            ),
            const SizedBox(
              height: 10,
            ),
            const SPButtonSecondaryState(
              state: SPButtonStatePrimaryState.validation,
              width: 247,
            ),
          ],
        ),
      ),
    );
  }
}
