import 'package:schoolap_pkg/schoolap_pkg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Card"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const SchoolAppCardTile(
              constraints: BoxConstraints(maxWidth: double.infinity),
              title: "Card title",
            ),
            const SizedBox(height: 10),
            SchoolAppCardTile(
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
                      const SizedBox(width: 10),
                      const Text(
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
            const SchoolAppCardAlert(
              type: SchoolAppCardAlertType.warning,
              title: "Card alert",
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SchoolapCardPresence(
                  type: SchoolAppCardPresenceType.absence,
                  label: 'Théo Zirko',
                ),
                SchoolapCardPresence(
                  type: SchoolAppCardPresenceType.presence,
                  label: 'Théo Zirko',
                ),
              ],
            ),
            const SizedBox(height: 10),
            const SCardWithImage(
                label: "Écrire un communiquer",
                imagePath: "assets/images/pen.png"),
          ],
        ),
      ),
    );
  }
}
