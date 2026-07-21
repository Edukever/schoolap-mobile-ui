import 'package:flutter/rendering.dart' show Color;

class SPColorsData {
  const SPColorsData({
    Color? red,
    Color? redLight,
    Color? black,
    Color? gray3,
    Color? gray2,
    Color? gray1,
    Color? grayLight,
    Color? white,
    Color? green,
    Color? greenLight,
    Color? blue,
    Color? blueLight,
    this.blue1 = const Color(0xFFAEDAEE),
    this.blue2 = const Color(0xFF43B4D6),
    Color? yellow,
    Color? yellowLight,
    Color? yellow1,
    this.orange = const Color(0xFFF68C2C),
    this.orange1 = const Color(0xFFFFB390),
    this.orangeLight = const Color(0xFFFFF2EC),
    @Deprecated('Use red instead.') Color? rouge,
    @Deprecated('Use redLight instead.') Color? rougeLight,
    @Deprecated('Use black instead.') Color? noir,
    @Deprecated('Use gray3 instead.') Color? grid3,
    @Deprecated('Use gray2 instead.') Color? grid2,
    @Deprecated('Use gray1 instead.') Color? grid1,
    @Deprecated('Use grayLight instead.') Color? gridLight,
    @Deprecated('Use white instead.') Color? blanc,
    @Deprecated('Use green instead.') Color? vert,
    @Deprecated('Use greenLight instead.') Color? vertLight,
    @Deprecated('Use blue instead.') Color? bleu,
    @Deprecated('Use blueLight instead.') Color? bleuLight,
    @Deprecated('Use yellow instead.') Color? jaune,
    @Deprecated('Use yellowLight instead.') Color? jauneLight,
    @Deprecated('Use yellow1 instead.') Color? jaune1,
  })  : red = red ?? rouge ?? const Color(0xFFFF4F4F),
        redLight = redLight ?? rougeLight ?? const Color(0xFFFFE1E1),
        black = black ?? noir ?? const Color(0xFF292D32),
        gray3 = gray3 ?? grid3 ?? const Color(0xFF4E4E4E),
        gray2 = gray2 ?? grid2 ?? const Color(0xFFAAAAAA),
        gray1 = gray1 ?? grid1 ?? const Color(0xFFE3E3E3),
        grayLight = grayLight ?? gridLight ?? const Color(0xFFF6F6F6),
        white = white ?? blanc ?? const Color(0xFFFFFFFF),
        green = green ?? vert ?? const Color(0xFF1EA951),
        greenLight = greenLight ?? vertLight ?? const Color(0xFFDDF3D6),
        blue = blue ?? bleu ?? const Color(0xFF17418A),
        blueLight = blueLight ?? bleuLight ?? const Color(0xFFE5F9FF),
        yellow = yellow ?? jaune ?? const Color(0xFFF2B200),
        yellowLight = yellowLight ?? jauneLight ?? const Color(0xFFFFF4D8),
        yellow1 = yellow1 ?? jaune1 ?? const Color(0xFFFFD954);

  final Color red;
  final Color redLight;
  final Color black;
  final Color gray3;
  final Color gray2;
  final Color gray1;
  final Color grayLight;
  final Color white;
  final Color green;
  final Color greenLight;
  final Color blue;
  final Color blueLight;
  final Color blue1;
  final Color blue2;
  final Color yellow;
  final Color yellowLight;
  final Color yellow1;
  final Color orange;
  final Color orange1;
  final Color orangeLight;

  @Deprecated('Use red instead.')
  Color get rouge => red;

  @Deprecated('Use redLight instead.')
  Color get rougeLight => redLight;

  @Deprecated('Use black instead.')
  Color get noir => black;

  @Deprecated('Use gray3 instead.')
  Color get grid3 => gray3;

  @Deprecated('Use gray2 instead.')
  Color get grid2 => gray2;

  @Deprecated('Use gray1 instead.')
  Color get grid1 => gray1;

  @Deprecated('Use grayLight instead.')
  Color get gridLight => grayLight;

  @Deprecated('Use white instead.')
  Color get blanc => white;

  @Deprecated('Use green instead.')
  Color get vert => green;

  @Deprecated('Use greenLight instead.')
  Color get vertLight => greenLight;

  @Deprecated('Use blue instead.')
  Color get bleu => blue;

  @Deprecated('Use blueLight instead.')
  Color get bleuLight => blueLight;

  @Deprecated('Use yellow instead.')
  Color get jaune => yellow;

  @Deprecated('Use yellowLight instead.')
  Color get jauneLight => yellowLight;

  @Deprecated('Use yellow1 instead.')
  Color get jaune1 => yellow1;

  factory SPColorsData.defaultColors() => const SPColorsData();
}
