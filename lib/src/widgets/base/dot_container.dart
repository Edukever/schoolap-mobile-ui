import 'package:schoolap_pkg/schoolap_pkg.dart';

class DotContainer extends StatelessWidget {
  const DotContainer({
    super.key,
    required this.iconOrTextColor,
  });

  final Color? iconOrTextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(color: iconOrTextColor, shape: BoxShape.circle),
    );
  }
}
