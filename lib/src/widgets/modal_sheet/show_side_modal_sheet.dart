part of '../widget.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Configuration types
// ─────────────────────────────────────────────────────────────────────────────

/// Which screen edge the sheet enters from.
enum SPSheetSide { left, right, top, bottom }

/// Controls the barrier and route transition.
class SPSheetRouteConfig {
  const SPSheetRouteConfig({
    this.barrierDismissible = false,
    this.barrierColor = const Color(0x3341A3DF),
    this.transitionDuration = const Duration(milliseconds: 300),
    this.barrierLabel = 'Sheet',
    this.useRootNavigator = true,
    this.routeSettings,
  });

  /// Whether tapping outside the sheet closes it.
  final bool barrierDismissible;

  /// Colour of the scrim behind the sheet.
  final Color barrierColor;

  final Duration transitionDuration;
  final String? barrierLabel;
  final bool useRootNavigator;
  final RouteSettings? routeSettings;
}

/// Visual appearance and sizing of the sheet.
class SPSheetStyle {
  const SPSheetStyle({
    this.side = SPSheetSide.right,
    this.backgroundColor,
    this.elevation = 8.0,
    this.padding = const EdgeInsets.all(16),
    this.width,
    this.height,
    this.scrollable = true,
  });

  /// Which edge the sheet enters from. Default: [SPSheetSide.right].
  final SPSheetSide side;

  /// Sheet background colour. Defaults to `Colors.white` when null.
  final Color? backgroundColor;

  /// Material elevation. Default: `8.0`.
  final double elevation;

  /// Inner padding applied around the header and body. Default: `EdgeInsets.all(16)`.
  final EdgeInsetsGeometry padding;

  /// Explicit width.
  ///
  /// * Left / right sheets: defaults to 75 % of screen on mobile, 25 % on desktop.
  /// * Top / bottom sheets: ignored — always full width.
  final double? width;

  /// Explicit height.
  ///
  /// * Left / right sheets: ignored — always fills the safe area height.
  /// * Top / bottom sheets: defaults to `null` (wraps content).
  final double? height;

  /// Wraps [body] in a [SingleChildScrollView] when `true` (default).
  /// Side sheets also get keyboard-avoid support via [Scaffold.resizeToAvoidBottomInset].
  final bool scrollable;
}

// ─────────────────────────────────────────────────────────────────────────────
// showSPSheet
// ─────────────────────────────────────────────────────────────────────────────

/// Presents a sheet that slides in from any screen edge.
///
/// ```dart
/// showSPSheet(
///   context: context,
///   body: MyForm(),
///   header: SPText.title2('Filtres'),
///   style: SPSheetStyle(side: SPSheetSide.bottom, height: 360),
/// );
/// ```
Future<T?> showSPSheet<T extends Object?>({
  required BuildContext context,
  required Widget body,
  // ── Content ────────────────────────────────────────────────────────────────
  Widget? header,
  bool withCloseButton = true,
  Widget? closeButton,
  // ── Behaviour ──────────────────────────────────────────────────────────────
  SPSheetStyle style = const SPSheetStyle(),
  SPSheetRouteConfig route = const SPSheetRouteConfig(),
}) {
  assert(
    !route.barrierDismissible || route.barrierLabel != null,
    'A barrierLabel is required when barrierDismissible is true.',
  );

  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: route.barrierDismissible,
    barrierColor: route.barrierColor,
    transitionDuration: route.transitionDuration,
    barrierLabel: route.barrierLabel,
    useRootNavigator: route.useRootNavigator,
    routeSettings: route.routeSettings,
    pageBuilder: (context, _, __) => _SPSheetPage(
      body: body,
      header: header,
      withCloseButton: withCloseButton,
      closeButton: closeButton,
      style: style,
    ),
    transitionBuilder: (_, animation, __, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: _slideBegin(style.side),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut)),
        child: child,
      );
    },
  );
}

// ─────────────────────────────────────────────────────────────────────────────
// Private helpers
// ─────────────────────────────────────────────────────────────────────────────

Offset _slideBegin(SPSheetSide side) => switch (side) {
      SPSheetSide.right => const Offset(1, 0),
      SPSheetSide.left => const Offset(-1, 0),
      SPSheetSide.top => const Offset(0, -1),
      SPSheetSide.bottom => const Offset(0, 1),
    };

Alignment _sheetAlignment(SPSheetSide side) => switch (side) {
      SPSheetSide.right => Alignment.centerRight,
      SPSheetSide.left => Alignment.centerLeft,
      SPSheetSide.top => Alignment.topCenter,
      SPSheetSide.bottom => Alignment.bottomCenter,
    };

BorderRadius _sheetRadius(SPSheetSide side, AppThemeData theme) {
  final r = theme.radius.extraLarge;
  return switch (side) {
    SPSheetSide.right => BorderRadius.only(topLeft: r, bottomLeft: r),
    SPSheetSide.left => BorderRadius.only(topRight: r, bottomRight: r),
    SPSheetSide.top => BorderRadius.only(bottomLeft: r, bottomRight: r),
    SPSheetSide.bottom => BorderRadius.only(topLeft: r, topRight: r),
  };
}

double _defaultWidth(BuildContext context) {
  final platform = Theme.of(context).platform;
  final screenWidth = MediaQuery.sizeOf(context).width;
  return (platform == TargetPlatform.android || platform == TargetPlatform.iOS)
      ? screenWidth * 0.75
      : screenWidth / 4;
}

// ─────────────────────────────────────────────────────────────────────────────
// Sheet page widget
// ─────────────────────────────────────────────────────────────────────────────

class _SPSheetPage extends StatelessWidget {
  const _SPSheetPage({
    required this.body,
    this.header,
    required this.withCloseButton,
    this.closeButton,
    required this.style,
  });

  final Widget body;
  final Widget? header;
  final bool withCloseButton;
  final Widget? closeButton;
  final SPSheetStyle style;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final side = style.side;
    final isSide = side == SPSheetSide.left || side == SPSheetSide.right;

    final br = _sheetRadius(side, theme);

    // ── Resolve dimensions ──────────────────────────────────────────────────

    // Width: side sheets → fixed; top/bottom → full
    final resolvedWidth =
        isSide ? (style.width ?? _defaultWidth(context)) : double.infinity;

    // ── Build content ───────────────────────────────────────────────────────

    final closeWidget = withCloseButton
        ? Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: closeButton ??
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: theme.colors.gray2,
                    child: const Icon(Icons.close, size: 15, color: Colors.white),
                  ),
            ),
          )
        : null;

    // Side sheets use a Scaffold so the keyboard pushes content up.
    // Top/bottom sheets: Scaffold when height is fixed, plain Column when auto.
    final useScaffold = style.scrollable && (isSide || style.height != null);

    Widget content;

    if (useScaffold) {
      content = Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          padding: style.padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (closeWidget != null) ...[closeWidget, const SizedBox(height: 8)],
              if (header != null) ...[header!, const SizedBox(height: 12)],
              body,
            ],
          ),
        ),
      );
    } else {
      content = Padding(
        padding: style.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (closeWidget != null) ...[closeWidget, const SizedBox(height: 8)],
            if (header != null) ...[header!, const SizedBox(height: 12)],
            body,
          ],
        ),
      );
    }

    // ── Material shell ──────────────────────────────────────────────────────

    Widget sheet = Material(
      elevation: style.elevation,
      color: style.backgroundColor ?? Colors.white,
      shape: RoundedRectangleBorder(borderRadius: br),
      clipBehavior: Clip.antiAlias,
      child: content,
    );

    // ── Size constraints ────────────────────────────────────────────────────

    if (isSide) {
      // Fill the full safe-area height; constrain only the width.
      sheet = FractionallySizedBox(
        heightFactor: 1.0,
        child: SizedBox(width: resolvedWidth, child: sheet),
      );
    } else {
      // Full width; optionally fixed height (null → wraps content).
      sheet = SizedBox(
        width: double.infinity,
        height: style.height,
        child: sheet,
      );
    }

    return SafeArea(
      child: Align(
        alignment: _sheetAlignment(side),
        child: sheet,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Deprecated
// ─────────────────────────────────────────────────────────────────────────────

@Deprecated(
  'Use showSPSheet instead.\n'
  'Migration guide:\n'
  '  showModalSideSheet(context: ctx, body: w)\n'
  '  → showSPSheet(\n'
  '      context: ctx,\n'
  '      body: w,\n'
  '      style: SPSheetStyle(\n'
  '        side: SPSheetSide.right,\n'
  '        width: 400,\n'
  '        height: 500,\n'
  '        elevation: 8.0,\n'
  '      ),\n'
  '      route: SPSheetRouteConfig(\n'
  '        barrierDismissible: false,\n'
  '        barrierColor: Color(0x3341A3DF),\n'
  '      ),\n'
  '    )\n'
  'Will be removed in a future version.',
)
Future<T?> showModalSideSheet<T extends Object?>({
  required BuildContext context,
  required Widget body,
  bool barrierDismissible = false,
  Color barrierColor = const Color(0x3341A3DF),
  double? width = 400,
  double height = 500,
  double elevation = 8.0,
  Duration transitionDuration = const Duration(milliseconds: 300),
  String? barrierLabel = 'Side Sheet',
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  bool withCloseControl = true,
  Widget? closeControl,
}) {
  return showSPSheet<T>(
    context: context,
    body: body,
    withCloseButton: withCloseControl,
    closeButton: closeControl,
    style: SPSheetStyle(
      side: SPSheetSide.right,
      elevation: elevation,
      width: width,
      height: height,
    ),
    route: SPSheetRouteConfig(
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      transitionDuration: transitionDuration,
      barrierLabel: barrierLabel,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
    ),
  );
}
