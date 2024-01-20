import 'package:schoolap_ui/schoolap_ui.dart';

class StateSecondaryButton extends StatelessWidget {
  final StatePrimaryButtonState state;
  final double? width;
  const StateSecondaryButton({super.key, required this.state, this.width});

  @override
  Widget build(BuildContext context) {
    const height = 45.0;
    switch (state) {
      case StatePrimaryButtonState.download:
        return SPButtonPrimary(
          title: "Télécharger",
          height: height,
          width: width,
          iconOrTextColor: const Color(0xFF41A3DF),
          backgroundColor: const Color(0xFFE5F9FF),
        );
      case StatePrimaryButtonState.validation:
        return SPButtonPrimary(
          title: "Validation",
          height: height,
          width: width,
          iconOrTextColor: const Color(0xFFFF4F4F),
          backgroundColor: const Color(0xFFFFE1E1),
        );

      case StatePrimaryButtonState.delete:
        return SPButtonPrimary(
          title: "Supprimer",
          height: height,
          width: width,
          iconOrTextColor: const Color(0xFF1EA951),
          backgroundColor: const Color(0xFFDDF3D6),
        );

      default:
        return Container();
    }
  }
}
