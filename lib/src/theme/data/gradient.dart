import 'package:flutter/rendering.dart' show LinearGradient, Alignment;
import 'package:schoolap_ui/src/theme/data/colors.dart';

class SPGradientData {
  const SPGradientData({
    required this.orange,
    required this.blue,
  });

  final LinearGradient orange;
  final LinearGradient blue;

  factory SPGradientData.defaultGradient(SPColorsData colors) =>
      SPGradientData(
        orange: LinearGradient(
          begin: const Alignment(0.96, 0.29),
          end: const Alignment(-0.96, -0.29),
          colors: [
            colors.orange,
            colors.jaune1,
          ],
        ),
        blue: LinearGradient(
          begin: const Alignment(-0.00, 1.00),
          end: const Alignment(0, -1),
          colors: [
            colors.bleu,
            colors.blue2,
          ],
        ),
      );
}
