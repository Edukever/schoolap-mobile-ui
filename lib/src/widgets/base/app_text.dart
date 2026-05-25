part of '../widget.dart';

enum AppTextLevel {
  title1,
  title2,
  title3,
  label,
  paragraph1,
  paragraph2,
}

class SPText extends StatelessWidget {
  /// Displays [data] using the theme's paragraph1 style by default.
  /// Pass [style] to merge overrides on top — identical to Flutter's [Text].
  const SPText(
    this.data, {
    super.key,
    this.level = AppTextLevel.paragraph1,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.semanticsLabel,
    this.minFontSize = 10.0,
  });

  const SPText.title1(
    this.data, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.semanticsLabel,
    this.minFontSize = 10.0,
  }) : level = AppTextLevel.title1;

  const SPText.title2(
    this.data, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.semanticsLabel,
    this.minFontSize = 10.0,
  }) : level = AppTextLevel.title2;

  const SPText.title3(
    this.data, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.semanticsLabel,
    this.minFontSize = 10.0,
  }) : level = AppTextLevel.title3;

  const SPText.label(
    this.data, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.semanticsLabel,
    this.minFontSize = 10.0,
  }) : level = AppTextLevel.label;

  const SPText.paragraph1(
    this.data, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.semanticsLabel,
    this.minFontSize = 10.0,
  }) : level = AppTextLevel.paragraph1;

  const SPText.paragraph2(
    this.data, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.semanticsLabel,
    this.minFontSize = 10.0,
  }) : level = AppTextLevel.paragraph2;

  final String data;
  final AppTextLevel level;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final String? semanticsLabel;
  final double minFontSize;

  TextStyle _baseStyle(AppThemeData theme) => switch (level) {
        AppTextLevel.title1 => theme.typography.title1,
        AppTextLevel.title2 => theme.typography.title2,
        AppTextLevel.title3 => theme.typography.title3,
        AppTextLevel.label => theme.typography.label,
        AppTextLevel.paragraph1 => theme.typography.paragraph1,
        AppTextLevel.paragraph2 => theme.typography.paragraph2,
      };

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final base = _baseStyle(theme);
    final effectiveStyle = base.merge(style).copyWith(
      color: style?.color ?? theme.colors.black,
    );

    return AutoSizeText(
      data,
      style: effectiveStyle,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      minFontSize: minFontSize,
      maxFontSize: style?.fontSize ?? base.fontSize ?? double.infinity,
    );
  }
}
