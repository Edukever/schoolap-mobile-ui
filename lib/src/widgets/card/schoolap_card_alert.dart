import 'package:schoolap_pkg/schoolap_pkg.dart';
import 'package:schoolap_pkg/src/widgets/base/app_card.dart';

enum SchoolAppCardAlertType {
  alert,
  warning,
  info,
  success,
}

class SchoolAppCardAlert extends StatelessWidget {
  final String title;
  final BoxConstraints? constraints;
  final SchoolAppCardAlertType type;

  const SchoolAppCardAlert({
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
      case SchoolAppCardAlertType.alert:
        backgroundColor = const Color(0xFFFFE1E1);
        iconData = Icons.warning_amber;
        iconColor = const Color(0xFFFF4F4F);
        break;
      case SchoolAppCardAlertType.warning:
        backgroundColor = const Color(
            0xFFE5F9FF); // Set the background color for the warning type
        iconData =
            Icons.warning_amber; // Set the icon data for the warning type
        iconColor =
            const Color(0xFF41A3DF); // Set the icon color for the warning type
        break;
      case SchoolAppCardAlertType.info:
        backgroundColor = const Color(
            0xFFDDF3D6); // Set the background color for the info type
        iconData = Icons.info_outline; // Set the icon data for the info type
        iconColor =
            const Color(0xFF1EA951); // Set the icon color for the info type
        break;
      case SchoolAppCardAlertType.success:
        backgroundColor = const Color(
            0xFFDDF3D6); // Set the background color for the success type
        iconData = Icons
            .check_circle_outline; // Set the icon data for the success type
        iconColor =
            const Color(0xFF1EA951); // Set the icon color for the success type
        break;
    }

    return SchoolAppCard(
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
              child: SchoolAppText(
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
