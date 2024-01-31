import 'package:flutter/material.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Card"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const SPCardTile(
              constraints: BoxConstraints(maxWidth: double.infinity),
              title: "Card title",
            ),
            const SizedBox(height: 10),
            SPCardTile(
              constraints: const BoxConstraints(maxWidth: double.infinity),
              title: 'Rapport du présence',
              subtitle: '11 décembre 2023 à 09:22',
              subtitleColor: const Color(0xFF41A3DF),
              subWidget: Opacity(
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
                      Icon(
                        Icons.person,
                        size: 15,
                        color: Color(0xFF41A3DF),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '26/28',
                        textAlign: TextAlign.center,
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
            const SPCardAlert(
              type: SPCardAlertType.warning,
              title: "Card alert",
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SchoolapCardPresence(
                  type: SPCardPresenceType.absence,
                  label: 'Théo Zirko',
                ),
                SchoolapCardPresence(
                  type: SPCardPresenceType.presence,
                  label: 'Théo Zirko',
                ),
              ],
            ),
            SPPopMenuButton(
              iconPath: AppIconsData.modifier,
              iconColor: Colors.amber,
              handleIconTap: (p0) => debugPrint(p0),
              items: const [
                ListItem(
                  value: 'modifier',
                  label: 'Modifier',
                  iconPath: AppIconsData.modifier,
                ),
                ListItem(
                  value: 'detail',
                  label: 'Détail',
                  iconPath: AppIconsData.detail,
                ),
                ListItem(
                  value: 'archiver',
                  label: 'Archiver',
                  iconPath: AppIconsData.archiver,
                ),

                // AppIconsData.modifier,
                // AppIconsData.detail,
                // AppIconsData.archiver,
              ],
            ),
            const SizedBox(height: 10),
            const SPCardWithImage(label: "Écrire un communiquer", imagePath: "assets/images/pen.png"),
            const SizedBox(height: 10),
            SPCardTile(
              constraints: const BoxConstraints(maxWidth: double.infinity),
              title: "Titre du communique",
              subtitle: '11 décembre 2023 à 09:22',
              subtitleColor: const Color(0xFF41A3DF),
              floatContentRight: Positioned(top: -10, right: 0, child: cardWithSmallOpacity()),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              child: SPCardTile(
                constraints: const BoxConstraints(maxWidth: double.infinity),
                title: "Titre du communique",
                subtitle: '11 décembre 2023 à 09:22',
                subtitleColor: const Color(0xFF41A3DF),
                leading: Container(),
                subWidget: Padding(padding: const EdgeInsets.only(top: 10), child: cardWithSmallOpacity()),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Opacity cardWithSmallOpacity() {
    return Opacity(
      opacity: 0.80,
      child: Container(
        width: 50,
        height: 18,
        decoration: ShapeDecoration(
          color: const Color(0xFFE5F9FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.37),
          ),
        ),
        child: const Center(
          child: Text(
            ' 9h45',
            style: TextStyle(
              color: Color(0xFF41A3DF),
              fontSize: 10,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
