import 'package:flutter/rendering.dart' show Color;

class AppColorsData {
  const AppColorsData({
    required this.rouge,
    required this.rougeLight,
    required this.noir,
    required this.grid3,
    required this.grid2,
    required this.grid1,
    required this.gridLight,
    required this.blanc,
    required this.vert,
    required this.vertLight,
    required this.bleu,
    required this.bleuLight,
    required this.blue1,
    required this.blue2,
    required this.jaune,
    required this.jauneLight,
    required this.jaune1,
    required this.orange,
    required this.orange1,
    required this.orangeLight,
  });

  final Color rouge;
  final Color rougeLight;
  final Color noir;
  final Color grid3;
  final Color grid2;
  final Color grid1;
  final Color gridLight;
  final Color blanc;
  final Color vert;
  final Color vertLight;
  final Color bleu;
  final Color bleuLight;
  final Color blue1;
  final Color blue2;
  final Color jaune;
  final Color jauneLight;
  final Color jaune1;
  final Color orange;
  final Color orange1;
  final Color orangeLight;

  factory AppColorsData.defaultColors() => const AppColorsData(
        rouge: Color(0xFFFF4F4F),
        rougeLight: Color(0xFFFFE1E1),
        noir: Color(0xFF292D32),
        grid3: Color(0xFF4E4E4E),
        grid2: Color(0xFFAAAAAA),
        grid1: Color(0xFFE3E3E3),
        gridLight: Color(0xFFF6F6F6),
        blanc: Color(0xFFFFFFFF),
        vert: Color(0xFF1EA951),
        vertLight: Color(0xFFDDF3D6),
        bleu: Color(0xFF41A3DF),
        bleuLight: Color(0xFFE5F9FF),
        blue1: Color(0xFFAEDAEE),
        blue2: Color(0xFF43B4D6),
        jaune: Color(0xFFF2B200),
        jauneLight: Color(0xFFFFF4D8),
        jaune1: Color(0xFFFFD954),
        orange: Color(0xFFF68C2C),
        orange1: Color(0xFFFFB390),
        orangeLight: Color(0xFFFFF2EC),
      );
}
