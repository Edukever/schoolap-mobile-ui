part of '../widget.dart';

enum SPButtonStatePrimaryState { download, validation, delete, disabled }

class SPButtonStatePrimary extends StatelessWidget {
  final SPButtonStatePrimaryState state;
  final double? width;
  final IconPosition? iconPosition;
  final void Function()? onPressed;
  const SPButtonStatePrimary({
    super.key,
    required this.state,
    this.width,
    this.iconPosition,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    const height = 45.0;
    switch (state) {
      case SPButtonStatePrimaryState.download:
        return SPButtonPrimary(
          title: "Télécharger",
          height: height,
          width: width,
          iconPosition: iconPosition,
          backgroundColor: const Color(0xFF41A3DF),
          onTap: onPressed,
        );
      case SPButtonStatePrimaryState.validation:
        return SPButtonPrimary(
          title: "Validation",
          height: height,
          width: width,
          iconPosition: iconPosition,
          backgroundColor: const Color(0xFFFF4F4F),
          onTap: onPressed,
        );

      case SPButtonStatePrimaryState.delete:
        return SPButtonPrimary(
          title: "Supprimer",
          height: height,
          iconPosition: iconPosition,
          width: width,
          backgroundColor: const Color(0xFF1EA951),
          onTap: onPressed,
        );
      case SPButtonStatePrimaryState.disabled:
        return SPButtonPrimary(
          title: "Supprimer",
          height: height,
          width: width,
          onTap: onPressed,
        );
      default:
        return Container();
    }
  }
}
