part of '../widget.dart';

enum AppTextLevel {
  paragraph1,
  paragraph2,

  title1,
  title2,
  title3,
}

class SPText extends StatelessWidget {
  const SPText(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    this.height,
    this.minFontSize = 10.0,
    this.textAlign,
    this.decoration = TextDecoration.none,
    this.level = AppTextLevel.paragraph1,
    this.letterSpacing,
    this.overflow,
  });

  const SPText.paragraph1(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.maxLines,
    this.textAlign,
    this.minFontSize = 10.0,
    this.decoration = TextDecoration.none,
    this.letterSpacing,
    this.overflow,
  }) : level = AppTextLevel.paragraph1;

  const SPText.paragraph2(
    this.data, {
    super.key,
    this.color,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    this.textAlign,
    this.minFontSize = 10.0,
    this.decoration = TextDecoration.none,
    this.letterSpacing,
    this.overflow,
  }) : level = AppTextLevel.paragraph2;

  const SPText.title1(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.height,
    this.textAlign,
    this.fontWeight,
    this.minFontSize = 10.0,
    this.decoration = TextDecoration.none,
    this.letterSpacing,
    this.overflow,
  }) : level = AppTextLevel.title1;

  const SPText.title2(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.height,
    this.textAlign,
    this.minFontSize = 10.0,
    this.letterSpacing,
    this.decoration = TextDecoration.none,
    this.overflow,
  }) : level = AppTextLevel.title2;

  const SPText.title3(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
    this.height,
    this.minFontSize = 10.0,
    this.decoration = TextDecoration.none,
    this.letterSpacing,
    this.overflow,
  }) : level = AppTextLevel.title3;

  final String data;
  final AppTextLevel level;
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  final FontWeight? fontWeight;
  final double minFontSize;
  final TextAlign? textAlign;
  final TextDecoration decoration;
  final double? height;

  final double? letterSpacing;

  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = this.color ?? theme.colors.noir;
    final style = () {
      switch (level) {
        case AppTextLevel.paragraph1:
          return theme.typography.paragraph1;
        case AppTextLevel.paragraph2:
          return theme.typography.paragraph2;
        case AppTextLevel.title1:
          return theme.typography.title1;
        case AppTextLevel.title2:
          return theme.typography.title2;
        case AppTextLevel.title3:
          return theme.typography.title3;
      }
    }();
    return AutoSizeText(
      data,
      style: style.copyWith(color: color, fontSize: fontSize, fontWeight: fontWeight, decoration: decoration, height: height),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      minFontSize: minFontSize,
      maxFontSize: fontSize ?? style.fontSize ?? 18,
    );
  }
}
