part of '../widget.dart';

enum StatePrimaryButtonState { download, validation, delete, disabled }

class StatePrimaryButton extends StatelessWidget {
  final StatePrimaryButtonState state;
  final double? width;
  const StatePrimaryButton({super.key, required this.state, this.width});

  @override
  Widget build(BuildContext context) {
    const height = 45.0;
    switch (state) {
      case StatePrimaryButtonState.download:
        return SPButtonPrimary(
          title: "Télécharger",
          height: height,
          width: width,
          backgroundColor: const Color(0xFF41A3DF),
        );
      case StatePrimaryButtonState.validation:
        return SPButtonPrimary(
          title: "Validation",
          height: height,
          width: width,
          backgroundColor: const Color(0xFFFF4F4F),
        );

      case StatePrimaryButtonState.delete:
        return SPButtonPrimary(
          title: "Supprimer",
          height: height,
          width: width,
          backgroundColor: const Color(0xFF1EA951),
        );
      case StatePrimaryButtonState.disabled:
        return SPButtonPrimary(
          title: "Supprimer",
          height: height,
          width: width,
        );
      default:
        return Container();
    }
  }
}
