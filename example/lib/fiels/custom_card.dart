import 'package:flutter/material.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

// ignore_for_file: deprecated_member_use

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SPAppBar('Cartes'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const SPCardTile(title: 'Card title'),
            const SizedBox(height: 10),
            SPCardTile(
              title: 'Rapport de présence',
              subtitle: '11 décembre 2023 à 09:22',
              subtitleColor: const Color(0xFF41A3DF),
              bottom: Opacity(
                opacity: 0.80,
                child: Container(
                  width: 80,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 10),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFE5F9FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.37),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.person, size: 15, color: Color(0xFF41A3DF)),
                      SizedBox(width: 10),
                      Text(
                        '26/28',
                        style: TextStyle(
                          color: Color(0xFF41A3DF),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const SPCardAlert(type: SPCardAlertType.warning, title: 'Card alert'),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SPCardPresence(type: SPCardPresenceType.absence, value: 'Théo Zirko'),
                SPCardPresence(type: SPCardPresenceType.presence, value: 'Théo Zirko'),
              ],
            ),
            const SizedBox(height: 10),
            const SPCardWithImage(
              label: 'Écrire un communiqué',
              image: AssetImage('assets/images/pen.png'),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
