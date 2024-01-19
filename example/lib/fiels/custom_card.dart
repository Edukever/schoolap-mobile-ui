import 'package:schoolap_pkg/schoolap_pkg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Card"),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 10),
            SchoolAppCardTile(
              constraints: BoxConstraints(maxWidth: double.infinity),
              title: "Card title",
            ),
            SizedBox(height: 10),
            SchoolAppCardAlert(
              type: SchoolAppCardAlertType.warning,
              title: "Card alert",
            ),
            SizedBox(height: 10),
            Row(
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
            SizedBox(height: 10),
            SCardWithImage(
                label: "Écrire un communiquer",
                imagePath: "assets/images/pen.png"),
          ],
        ),
      ),
    );
  }
}
