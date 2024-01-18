import 'package:schoolap_pkg/schoolap_pkg.dart';

enum StatePrimaryButtonState { download, validation, delete }

class StatePrimaryButton extends StatelessWidget {
  final StatePrimaryButtonState state;
  final double? width;
  const StatePrimaryButton({super.key, required this.state, this.width});

  @override
  Widget build(BuildContext context) {
    const height = 45.0;
    switch (state) {
      case StatePrimaryButtonState.download:
        return PrimaryButton(
          title: "Télécharger",
          height: height,
          width: width,
          backgroundColor: const Color(0xFF41A3DF),
        );
      case StatePrimaryButtonState.validation:
        return PrimaryButton(
          title: "Validation",
          height: height,
          width: width,
          backgroundColor: const Color(0xFFFF4F4F),
        );

      case StatePrimaryButtonState.delete:
        return PrimaryButton(
          title: "Supprimer",
          height: height,
          width: width,
          backgroundColor: const Color(0xFF1EA951),
        );

      default:
        return Container();
    }
  }
}
