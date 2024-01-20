import 'package:schoolap_ui/schoolap_ui.dart';

class DotContainer extends StatelessWidget {
  final double? size;
  const DotContainer({
    super.key,
    required this.iconOrTextColor,
    this.size,
  });

  final Color? iconOrTextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 10,
      width: size ?? 10,
      decoration: BoxDecoration(color: iconOrTextColor, shape: BoxShape.circle),
    );
  }
}
