part of '../widget.dart';

enum SPCardPresenceType implements Comparable<SPCardPresenceType> {
  presence(backgroundColor: Color(0xFFDDF3D6), subtitleColor: Color(0xFF1EA951)),
  absence(backgroundColor: Color(0xFFFFE1E1), subtitleColor: Color(0xFFFF4F4F));

  const SPCardPresenceType({
    required this.backgroundColor,
    required this.subtitleColor,
  });

  final Color backgroundColor;
  final Color subtitleColor;

  @override
  int compareTo(SPCardPresenceType other) => toString().compareTo(other.toString());
}

class SchoolapCardPresence extends StatelessWidget {
  final SPCardPresenceType type;
  final String label;
  final VoidCallback? onTap;

  const SchoolapCardPresence({
    super.key,
    required this.type,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color subtitleColor;
    String title;

    switch (type) {
      case SPCardPresenceType.presence:
        backgroundColor = SPCardPresenceType.presence.backgroundColor;
        subtitleColor = SPCardPresenceType.presence.subtitleColor;
        title = "Présence";
        break;
      case SPCardPresenceType.absence:
        backgroundColor = SPCardPresenceType.absence.backgroundColor;
        subtitleColor = SPCardPresenceType.absence.subtitleColor;
        title = "Absence";
        break;
    }

    return SPCard(
      onTap: onTap,
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
            Align(alignment: Alignment.bottomRight, child: DotContainer(iconOrTextColor: subtitleColor)),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SPText(
                    label,
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
