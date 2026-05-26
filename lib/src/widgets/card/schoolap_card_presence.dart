part of '../widget.dart';

enum SPCardPresenceType {
  presence(
    background: Color(0xFFDDF3D6),
    color: Color(0xFF1EA951),
    label: 'Présence',
  ),
  absence(
    background: Color(0xFFFFE1E1),
    color: Color(0xFFFF4F4F),
    label: 'Absence',
  );

  const SPCardPresenceType({
    required this.background,
    required this.color,
    required this.label,
  });

  final Color background;
  final Color color;

  /// Human-readable label shown as the card subtitle.
  final String label;
}

class SPCardPresence extends StatelessWidget {
  const SPCardPresence({
    super.key,
    required this.type,
    required this.value,
    this.onTap,
    this.width = 150,
    this.height = 100,
  });

  final SPCardPresenceType type;

  /// Primary value displayed in the card (e.g. a count or a name).
  final String value;

  final VoidCallback? onTap;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SPCard(
      onTap: onTap,
      backgroundColor: type.background,
      constraints: BoxConstraints.tight(Size(width, height)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: DotContainer(color: type.color),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SPText(
                  value,
                  style: const TextStyle(fontSize: 18),
                  level: AppTextLevel.title1,
                ),
                Text(
                  type.label,
                  style: TextStyle(color: type.color),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
