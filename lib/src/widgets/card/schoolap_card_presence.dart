import 'package:schoolap_pkg/schoolap_pkg.dart';
import 'package:schoolap_pkg/src/widgets/base/app_card.dart';
import 'package:schoolap_pkg/src/widgets/base/dot_container.dart';

enum SchoolAppCardPresenceType
    implements Comparable<SchoolAppCardPresenceType> {
  presence(
      backgroundColor: Color(0xFFDDF3D6), subtitleColor: Color(0xFF1EA951)),
  absence(backgroundColor: Color(0xFFFFE1E1), subtitleColor: Color(0xFFFF4F4F));

  const SchoolAppCardPresenceType({
    required this.backgroundColor,
    required this.subtitleColor,
  });

  final Color backgroundColor;
  final Color subtitleColor;

  @override
  int compareTo(SchoolAppCardPresenceType other) =>
      toString().compareTo(other.toString());
}

class SchoolapCardPresence extends StatelessWidget {
  final SchoolAppCardPresenceType type;

  const SchoolapCardPresence({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color subtitleColor;
    String title;

    switch (type) {
      case SchoolAppCardPresenceType.presence:
        backgroundColor = SchoolAppCardPresenceType.presence.backgroundColor;
        subtitleColor = SchoolAppCardPresenceType.presence.subtitleColor;
        title = "Présence";
        break;
      case SchoolAppCardPresenceType.absence:
        backgroundColor = SchoolAppCardPresenceType.absence.backgroundColor;
        subtitleColor = SchoolAppCardPresenceType.absence.subtitleColor;
        title = "Absence";
        break;
      default:
        backgroundColor = Colors.transparent;
        subtitleColor = Colors.black;
        title = "";
        break;
    }

    return SchoolAppCard(
      backgroundColor: backgroundColor,
      constraints: const BoxConstraints(
        maxWidth: 150,
        maxHeight: 100,
        minHeight: 100,
        minWidth: 150,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.bottomRight,
                child: DotContainer(iconOrTextColor: subtitleColor)),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SchoolAppText(
                    'Théo Zirko',
                    fontSize: 18,
                    level: AppTextLevel.title1,
                  ),
                  Text(
                    title,
                    style: TextStyle(color: subtitleColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
