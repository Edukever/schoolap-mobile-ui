part of '../widget.dart';

class SPButtonSecondaryState extends StatelessWidget {
  final SPButtonStatePrimaryState state;
  final String? label;
  final Widget? icon;
  final double? width;
  final double? fontSize;
  final IconPosition? iconPosition;

  const SPButtonSecondaryState({super.key, required this.state, this.width, this.label, this.icon, this.fontSize, this.iconPosition});

  @override
  Widget build(BuildContext context) {
    const height = 45.0;
    switch (state) {
      case SPButtonStatePrimaryState.download:
        return SPButtonPrimary(
          title: label ?? "Télécharger",
          height: height,
          width: width,
          fontSize: fontSize,
          iconPosition: iconPosition,

          iconOrTextColor: const Color(0xFF41A3DF),
          backgroundColor: const Color(0xFFE5F9FF),
        );
      case SPButtonStatePrimaryState.validation:
        return SPButtonPrimary(
          title: label ?? "Validation",
          height: height,
          width: width,
          fontSize: fontSize,
          iconPosition: iconPosition,
          iconOrTextColor: const Color(0xFFFF4F4F),
          backgroundColor: const Color(0xFFFFE1E1),
        );

      case SPButtonStatePrimaryState.delete:
        return SPButtonPrimary(
          icon: icon,
          title: label ?? "Supprimer",
          height: height,
          fontSize: fontSize,
          iconPosition: iconPosition,
          width: width,
          iconOrTextColor: const Color(0xFF1EA951),
          backgroundColor: const Color(0xFFDDF3D6),
        );

      default:
        return Container();
    }
  }
}
