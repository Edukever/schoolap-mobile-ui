import 'package:schoolap_ui/schoolap_ui.dart';

enum SPButtonStatePrimaryState { download, validation, delete, disabled }

class SPButtonStatePrimary extends StatelessWidget {
  final SPButtonStatePrimaryState state;
  final double? width;
  const SPButtonStatePrimary({super.key, required this.state, this.width});

  @override
  Widget build(BuildContext context) {
    const height = 45.0;
    switch (state) {
      case SPButtonStatePrimaryState.download:
        return SPButtonPrimary(
          title: "Télécharger",
          height: height,
          width: width,
          backgroundColor: const Color(0xFF41A3DF),
        );
      case SPButtonStatePrimaryState.validation:
        return SPButtonPrimary(
          title: "Validation",
          height: height,
          width: width,
          backgroundColor: const Color(0xFFFF4F4F),
        );

      case SPButtonStatePrimaryState.delete:
        return SPButtonPrimary(
          title: "Supprimer",
          height: height,
          width: width,
          backgroundColor: const Color(0xFF1EA951),
        );
      case SPButtonStatePrimaryState.disabled:
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
