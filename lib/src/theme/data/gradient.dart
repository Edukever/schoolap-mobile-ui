import 'package:flutter/rendering.dart' show LinearGradient, Alignment;
import 'package:schoolap_pkg/src/theme/data/colors.dart';

class AppGradientData {
  const AppGradientData._();

  static const LinearGradient orange = LinearGradient(
    begin: Alignment(0.96, 0.29),
    end: Alignment(-0.96, -0.29),
    colors: [
      AppColorsData.orange,
      AppColorsData.jaune1,
    ],
  );

  static const LinearGradient blue = LinearGradient(
    begin: Alignment(-0.00, 1.00),
    end: Alignment(0, -1),
    colors: [
      AppColorsData.bleu,
      AppColorsData.blue2,
    ],
  );
}
