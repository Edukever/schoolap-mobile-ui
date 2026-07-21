import 'package:flutter/rendering.dart' show LinearGradient, Alignment, Color;
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
            colors.yellow1,
          ],
        ),
        // Matches design spec: linear-gradient(190.75deg, #0F89CB -32.7%, #17418A 64.68%)
        blue: LinearGradient(
          begin: const Alignment(0.19, -0.98),
          end: const Alignment(-0.19, 0.98),
          colors: [
            const Color(0xFF0F89CB),
            colors.blue,
          ],
        ),
      );
}
