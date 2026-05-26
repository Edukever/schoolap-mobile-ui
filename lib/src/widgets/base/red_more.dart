import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

enum SPTrimMode { length, line }

class SPReadMoreText extends StatefulWidget {
  const SPReadMoreText(
    this.data, {
    super.key,
    this.preDataText,
    this.postDataText,
    this.preDataTextStyle,
    this.postDataTextStyle,
    this.trimExpandedText = 'show less',
    this.trimCollapsedText = 'read more',
    this.colorClickableText,
    this.trimLength = 240,
    this.trimLines = 2,
    this.trimMode = SPTrimMode.length,
    this.style,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.semanticsLabel,
    this.moreStyle,
    this.lessStyle,
    this.delimiter = '$_kEllipsis ',
    this.delimiterStyle,
    this.callback,
    this.onLinkPressed,
    this.linkTextStyle,
  });

  final String data;
  final int trimLength;
  final int trimLines;
  final SPTrimMode trimMode;
  final TextStyle? moreStyle;
  final TextStyle? lessStyle;
  final String? preDataText;
  final String? postDataText;
  final TextStyle? preDataTextStyle;
  final TextStyle? postDataTextStyle;
  final Function(bool val)? callback;
  final ValueChanged<String>? onLinkPressed;
  final TextStyle? linkTextStyle;
  final String delimiter;
  final String trimExpandedText;
  final String trimCollapsedText;
  final Color? colorClickableText;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final String? semanticsLabel;
  final TextStyle? delimiterStyle;

  @override
  State<SPReadMoreText> createState() => _SPReadMoreTextState();
}

const String _kEllipsis = '…';
const String _kLineSeparator = ' ';

class _SPReadMoreTextState extends State<SPReadMoreText> {
  bool _readMore = true;

  void _onTapLink() {
    setState(() {
      _readMore = !_readMore;
      widget.callback?.call(_readMore);
    });
  }

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context);
    final effectiveTextStyle = (widget.style?.inherit ?? false)
        ? defaultTextStyle.style.merge(widget.style)
        : widget.style;

    final textAlign =
        widget.textAlign ?? defaultTextStyle.textAlign ?? TextAlign.start;
    final textDirection =
        widget.textDirection ?? Directionality.of(context);
    final textScaler = MediaQuery.textScalerOf(context);
    final overflow = defaultTextStyle.overflow;
    final locale = widget.locale ?? Localizations.maybeLocaleOf(context);

    final colorClickableText =
        widget.colorClickableText ?? Theme.of(context).colorScheme.secondary;
    final defaultLessStyle = widget.lessStyle ??
        effectiveTextStyle?.copyWith(color: colorClickableText);
    final defaultMoreStyle = widget.moreStyle ??
        effectiveTextStyle?.copyWith(color: colorClickableText);
    final defaultDelimiterStyle = widget.delimiterStyle ?? effectiveTextStyle;

    final link = TextSpan(
      text: _readMore ? widget.trimCollapsedText : widget.trimExpandedText,
      style: _readMore ? defaultMoreStyle : defaultLessStyle,
      recognizer: TapGestureRecognizer()..onTap = _onTapLink,
    );

    final delimiter = TextSpan(
      text: _readMore
          ? widget.trimCollapsedText.isNotEmpty
              ? widget.delimiter
              : ''
          : '',
      style: defaultDelimiterStyle,
      recognizer: TapGestureRecognizer()..onTap = _onTapLink,
    );

    Widget result = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);
        final maxWidth = constraints.maxWidth;

        final preTextSpan = widget.preDataText != null
            ? TextSpan(
                text: '${widget.preDataText!} ',
                style: widget.preDataTextStyle ?? effectiveTextStyle,
              )
            : null;
        final postTextSpan = widget.postDataText != null
            ? TextSpan(
                text: ' ${widget.postDataText!}',
                style: widget.postDataTextStyle ?? effectiveTextStyle,
              )
            : null;

        final text = TextSpan(
          children: [
            if (preTextSpan != null) preTextSpan,
            TextSpan(text: widget.data, style: effectiveTextStyle),
            if (postTextSpan != null) postTextSpan,
          ],
        );

        final textPainter = TextPainter(
          text: link,
          textAlign: textAlign,
          textDirection: textDirection,
          textScaler: textScaler,
          maxLines: widget.trimLines,
          ellipsis:
              overflow == TextOverflow.ellipsis ? widget.delimiter : null,
          locale: locale,
        );
        textPainter.layout(minWidth: 0, maxWidth: maxWidth);
        final linkSize = textPainter.size;

        textPainter.text = delimiter;
        textPainter.layout(minWidth: 0, maxWidth: maxWidth);
        final delimiterSize = textPainter.size;

        textPainter.text = text;
        textPainter.layout(
            minWidth: constraints.minWidth, maxWidth: maxWidth);
        final textSize = textPainter.size;

        bool linkLongerThanLine = false;
        int endIndex;

        if (linkSize.width < maxWidth) {
          final readMoreSize = linkSize.width + delimiterSize.width;
          final pos = textPainter.getPositionForOffset(Offset(
            textDirection == TextDirection.rtl
                ? readMoreSize
                : textSize.width - readMoreSize,
            textSize.height,
          ));
          endIndex = textPainter.getOffsetBefore(pos.offset) ?? 0;
        } else {
          final pos = textPainter.getPositionForOffset(
            textSize.bottomLeft(Offset.zero),
          );
          endIndex = pos.offset;
          linkLongerThanLine = true;
        }

        final linkStyle = effectiveTextStyle?.copyWith(
          decoration: TextDecoration.underline,
          color: Colors.blue,
        );

        final textSpan = switch (widget.trimMode) {
          SPTrimMode.length => _buildData(
              data: widget.trimLength < widget.data.length && _readMore
                  ? widget.data.substring(0, widget.trimLength)
                  : widget.data,
              textStyle: effectiveTextStyle,
              linkTextStyle: linkStyle,
              onPressed: widget.onLinkPressed,
              children:
                  widget.trimLength < widget.data.length ? [delimiter, link] : [],
            ),
          SPTrimMode.line => _buildData(
              data: textPainter.didExceedMaxLines && _readMore
                  ? widget.data.substring(0, endIndex) +
                      (linkLongerThanLine ? _kLineSeparator : '')
                  : widget.data,
              textStyle: effectiveTextStyle,
              linkTextStyle: linkStyle,
              onPressed: widget.onLinkPressed,
              children:
                  textPainter.didExceedMaxLines ? [delimiter, link] : [],
            ),
        };

        return Text.rich(
          TextSpan(
            children: [
              if (preTextSpan != null) preTextSpan,
              textSpan,
              if (postTextSpan != null) postTextSpan,
            ],
          ),
          textAlign: textAlign,
          textDirection: textDirection,
          softWrap: true,
          overflow: TextOverflow.clip,
          textScaler: textScaler,
        );
      },
    );

    if (widget.semanticsLabel != null) {
      result = Semantics(
        textDirection: widget.textDirection,
        label: widget.semanticsLabel,
        child: ExcludeSemantics(child: result),
      );
    }
    return result;
  }

  static final _linkPattern =
      RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');

  TextSpan _buildData({
    required String data,
    TextStyle? textStyle,
    TextStyle? linkTextStyle,
    ValueChanged<String>? onPressed,
    required List<TextSpan> children,
  }) {
    final contents = <TextSpan>[];

    while (_linkPattern.hasMatch(data)) {
      final match = _linkPattern.firstMatch(data)!;
      contents
        ..add(TextSpan(text: data.substring(0, match.start)))
        ..add(TextSpan(
          text: data.substring(match.start, match.end),
          style: linkTextStyle,
          recognizer: TapGestureRecognizer()
            ..onTap = () => onPressed?.call(
                  data.substring(match.start, match.end).trim(),
                ),
        ));
      data = data.substring(match.end);
    }
    contents.add(TextSpan(text: data));

    return TextSpan(
      children: contents..addAll(children),
      style: textStyle,
    );
  }
}

// ─── Deprecated ───────────────────────────────────────────────────────────────

@Deprecated(
  'Use SPTrimMode instead.\n'
  'Migration: TrimMode.length → SPTrimMode.length, TrimMode.line → SPTrimMode.line.\n'
  'Will be removed in a future version.',
)
typedef TrimMode = SPTrimMode;
