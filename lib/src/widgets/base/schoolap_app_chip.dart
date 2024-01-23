part of '../widget.dart';

enum AppChipType { none, icon, dot }

class SPChip extends StatelessWidget {
  final String label;
  final double? width;
  final double? height;
  final Color? iconOrTextColor;
  final AppChipType appChipType;
  final Widget? icon;
  final Color? backgroundColor;

  const SPChip(
      {super.key,
      required this.label,
      this.width,
      this.height,
      this.iconOrTextColor,
      this.appChipType = AppChipType.none,
      this.icon,
      this.backgroundColor})
      : assert(
          appChipType != AppChipType.icon || icon != null,
          'Invalid configuration: icon should be provided when appChipType is only icon.',
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 125,
      height: height ?? 40,
      padding: const EdgeInsets.symmetric(horizontal: 14.62, vertical: 3.48),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: backgroundColor ?? const Color(0xFFFFE1E1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.18),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _buildButtonChildren(),
      ),
    );
  }

  List<Widget> _buildButtonChildren() {
    final List<Widget> children = [];

    if (appChipType == AppChipType.dot) {
      children.add(
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: DotContainer(iconOrTextColor: iconOrTextColor),
        ),
      );
    }
    if (appChipType == AppChipType.icon) {
      children.add(
        icon!,
      );
    }
    children.add(
      SPText.title1(
        label,
        color: iconOrTextColor ?? Colors.white,
        fontSize: 14,
      ),
    );

    return children;
  }
}
