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
    Key? key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    this.minFontSize = 10.0,
    this.level = AppTextLevel.paragraph1,
  }) : super(key: key);

  const SPText.paragraph1(
    this.data, {
    Key? key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    this.minFontSize = 10.0,
  })  : level = AppTextLevel.paragraph1,
        super(key: key);

  const SPText.paragraph2(
    this.data, {
    Key? key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    this.minFontSize = 10.0,
  })  : level = AppTextLevel.paragraph2,
        super(key: key);

  const SPText.title1(
    this.data, {
    Key? key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.minFontSize = 10.0,
  })  : level = AppTextLevel.title1,
        super(key: key);

  const SPText.title2(
    this.data, {
    Key? key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.minFontSize = 10.0,
  })  : level = AppTextLevel.title2,
        super(key: key);

  const SPText.title3(
    this.data, {
    Key? key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.minFontSize = 10.0,
  })  : level = AppTextLevel.title3,
        super(key: key);

  final String data;
  final AppTextLevel level;
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  final FontWeight? fontWeight;
  final double minFontSize;

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
      style: style.copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      maxLines: maxLines,
      minFontSize: minFontSize,
      maxFontSize: fontSize ?? style.fontSize ?? 18,
    );
  }
}
