import 'package:schoolap_ui/schoolap_ui.dart';
import 'package:schoolap_ui/src/widgets/base/app_card.dart';

enum SPCardAlertType {
  alert,
  warning,
  info,
  success,
}

class SPCardAlert extends StatelessWidget {
  final String title;
  final BoxConstraints? constraints;
  final SPCardAlertType type;

  const SPCardAlert({
    Key? key,
    required this.title,
    this.constraints,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    IconData iconData;
    Color iconColor;

    switch (type) {
      case SPCardAlertType.alert:
        backgroundColor = const Color(0xFFFFE1E1);
        iconData = Icons.warning_amber;
        iconColor = const Color(0xFFFF4F4F);
        break;
      case SPCardAlertType.warning:
        backgroundColor = const Color(
            0xFFE5F9FF); // Set the background color for the warning type
        iconData =
            Icons.warning_amber; // Set the icon data for the warning type
        iconColor =
            const Color(0xFF41A3DF); // Set the icon color for the warning type
        break;
      case SPCardAlertType.info:
        backgroundColor = const Color(
            0xFFDDF3D6); // Set the background color for the info type
        iconData = Icons.info_outline; // Set the icon data for the info type
        iconColor =
            const Color(0xFF1EA951); // Set the icon color for the info type
        break;
      case SPCardAlertType.success:
        backgroundColor = const Color(
            0xFFDDF3D6); // Set the background color for the success type
        iconData = Icons
            .check_circle_outline; // Set the icon data for the success type
        iconColor =
            const Color(0xFF1EA951); // Set the icon color for the success type
        break;
    }

    return SPCard(
      backgroundColor: backgroundColor,
      constraints:
          constraints ?? const BoxConstraints(maxWidth: double.infinity),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Icon(
              iconData,
              color: iconColor,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: SPText(
                title,
                fontSize: 14,
                level: AppTextLevel.paragraph1,
                color: iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
