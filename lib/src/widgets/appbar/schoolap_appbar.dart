part of '../widget.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Supporting types
// ─────────────────────────────────────────────────────────────────────────────

/// Controls the size of the rounded bottom corners on [SPAppBar].
enum SPAppBarRadius { full, medium, small, none }

/// Notification bell configuration for [SPAppBar.main].
class SPAppBarNotification {
  const SPAppBarNotification({
    this.show = true,
    this.showBadge = false,
    this.badgeLabel,
    this.onTap,
  });

  /// Whether the notification bell is visible.
  final bool show;

  /// Whether the badge count/dot is shown.
  final bool showBadge;

  /// Text shown inside the badge (e.g. `'5'`).
  final String? badgeLabel;

  /// Called when the bell icon is tapped.
  final VoidCallback? onTap;
}

enum _SPAppBarVariant { standard, landscape, main }

// ─────────────────────────────────────────────────────────────────────────────
// SPAppBar
// ─────────────────────────────────────────────────────────────────────────────

/// A unified, customisable app bar for the Schoolap design system.
///
/// Three layout variants are available via named constructors:
///
/// * [SPAppBar] — centered title with an optional auto-detected back button.
/// * [SPAppBar.landscape] — horizontal leading / title / trailing row, suited
///   to wider or secondary screens.
/// * [SPAppBar.main] — home-screen layout with a logo row, notification bell,
///   and arbitrary body content below.
///
/// All variants share the same appearance parameters:
/// [backgroundColor], [shadow], [bottomRadius], [showGridDecoration].
class SPAppBar extends StatelessWidget implements PreferredSizeWidget {
  // ── Standard ─────────────────────────────────────────────────────────────────

  /// Standard app bar with a centered [title].
  ///
  /// A back button is shown automatically when the navigator can pop, unless
  /// [automaticallyImplyLeading] is `false` or a custom [leading] widget is
  /// supplied.
  const SPAppBar(
    String title, {
    Key? key,
    // ── Content ──────────────────────────────────────────────────────────────
    Widget? titleWidget,
    Widget? leading,
    Widget? trailing,
    // ── Navigation ───────────────────────────────────────────────────────────
    bool automaticallyImplyLeading = true,
    VoidCallback? onLeadingTap,
    // ── Appearance ───────────────────────────────────────────────────────────
    double height = 80,
    Color? backgroundColor,
    bool shadow = false,
    SPAppBarRadius bottomRadius = SPAppBarRadius.full,
    bool showGridDecoration = true,
  }) : this._(
          key: key,
          titleText: title,
          titleWidget: titleWidget,
          leading: leading,
          trailing: trailing,
          automaticallyImplyLeading: automaticallyImplyLeading,
          onLeadingTap: onLeadingTap,
          height: height,
          backgroundColor: backgroundColor,
          shadow: shadow,
          bottomRadius: bottomRadius,
          showGridDecoration: showGridDecoration,
          variant: _SPAppBarVariant.standard,
        );

  // ── Landscape ────────────────────────────────────────────────────────────────

  /// Landscape-style app bar with a horizontal leading / title / trailing row.
  ///
  /// Uses [SPAppBarRadius.medium] bottom corners by default.
  const SPAppBar.landscape({
    Key? key,
    // ── Content ──────────────────────────────────────────────────────────────
    String? title,
    Widget? titleWidget,
    Widget? leading,
    Widget? trailing,
    // ── Navigation ───────────────────────────────────────────────────────────
    bool automaticallyImplyLeading = true,
    VoidCallback? onLeadingTap,
    // ── Appearance ───────────────────────────────────────────────────────────
    required double height,
    Color? backgroundColor,
    bool shadow = false,
    SPAppBarRadius bottomRadius = SPAppBarRadius.medium,
    bool showGridDecoration = true,
  }) : this._(
          key: key,
          titleText: title,
          titleWidget: titleWidget,
          leading: leading,
          trailing: trailing,
          automaticallyImplyLeading: automaticallyImplyLeading,
          onLeadingTap: onLeadingTap,
          height: height,
          backgroundColor: backgroundColor,
          shadow: shadow,
          bottomRadius: bottomRadius,
          showGridDecoration: showGridDecoration,
          variant: _SPAppBarVariant.landscape,
        );

  // ── Main ──────────────────────────────────────────────────────────────────────

  /// Home-screen app bar with a logo row, notification bell, and body content.
  ///
  /// Pass [logo] to replace the default Schoolap logo pair with any widget
  /// (e.g. `Image.asset('assets/my_logo.png')` or a custom `Row`).
  ///
  /// The notification bell is configured via [notification]. Pass
  /// `SPAppBarNotification(show: false)` to hide it.
  const SPAppBar.main({
    Key? key,
    // ── Content ──────────────────────────────────────────────────────────────
    Widget? logo,
    required Widget child,
    // ── Notification ─────────────────────────────────────────────────────────
    SPAppBarNotification notification = const SPAppBarNotification(),
    // ── Appearance ───────────────────────────────────────────────────────────
    required double height,
    Color? backgroundColor,
    bool shadow = false,
    SPAppBarRadius bottomRadius = SPAppBarRadius.full,
    bool showGridDecoration = true,
  }) : this._(
          key: key,
          logo: logo,
          bottom: child,
          notification: notification,
          height: height,
          backgroundColor: backgroundColor,
          shadow: shadow,
          bottomRadius: bottomRadius,
          showGridDecoration: showGridDecoration,
          variant: _SPAppBarVariant.main,
        );

  // ── Canonical constructor ─────────────────────────────────────────────────────

  const SPAppBar._({
    super.key,
    this.titleText,
    this.titleWidget,
    this.leading,
    this.trailing,
    this.automaticallyImplyLeading = true,
    this.onLeadingTap,
    this.height = 80,
    this.backgroundColor,
    this.shadow = false,
    this.bottomRadius = SPAppBarRadius.full,
    this.showGridDecoration = true,
    this.logo,
    this.notification,
    this.bottom,
    required _SPAppBarVariant variant,
  }) : _variant = variant;

  // ── Content ───────────────────────────────────────────────────────────────────

  /// Title text. Takes priority over [titleWidget] if both are set.
  final String? titleText;

  /// Custom title widget. Used when [titleText] is null.
  final Widget? titleWidget;

  /// Widget placed on the leading (left) side.
  /// In the standard variant, replaces the auto back button entirely.
  final Widget? leading;

  /// Widget placed on the trailing (right) side.
  final Widget? trailing;

  // ── Navigation ────────────────────────────────────────────────────────────────

  /// When `true` (default), shows a back button if [Navigator.canPop].
  final bool automaticallyImplyLeading;

  /// Overrides the default back-navigation callback.
  final VoidCallback? onLeadingTap;

  // ── Appearance ────────────────────────────────────────────────────────────────

  final double height;
  final Color? backgroundColor;
  final bool shadow;
  final SPAppBarRadius bottomRadius;

  /// Whether the decorative trapeze-grid SVG is painted in the top-right corner.
  final bool showGridDecoration;

  // ── Main-variant ──────────────────────────────────────────────────────────────

  /// Replaces the default Schoolap logo pair in [SPAppBar.main].
  ///
  /// Pass any widget — `Image.asset(...)`, a `Row` with text, etc.
  /// When `null` the built-in pen + name images are shown.
  final Widget? logo;

  /// Notification bell configuration. Only used by [SPAppBar.main].
  final SPAppBarNotification? notification;

  /// Body content below the top row. Only used by [SPAppBar.main].
  final Widget? bottom;

  final _SPAppBarVariant _variant;

  // ─────────────────────────────────────────────────────────────────────────────

  @override
  Size get preferredSize => Size.fromHeight(height);

  Radius _resolveRadius(AppThemeData theme) => switch (bottomRadius) {
        SPAppBarRadius.full => theme.radius.full,
        SPAppBarRadius.medium => theme.radius.medium,
        SPAppBarRadius.small => theme.radius.small,
        SPAppBarRadius.none => Radius.zero,
      };

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final br = _resolveRadius(theme);

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colors.blue,
        borderRadius: BorderRadius.only(
          bottomLeft: br,
          bottomRight: br,
        ),
        boxShadow: shadow
            ? const [
                BoxShadow(
                  color: Color.fromRGBO(185, 212, 208, 0.87),
                  offset: Offset(0, 6),
                  blurRadius: 15,
                ),
              ]
            : null,
      ),
      child: Stack(
        children: [
          // Decorative background grid
          if (showGridDecoration)
            Positioned(
              top: 0,
              right: 0,
              child: _variant == _SPAppBarVariant.standard
                  ? Transform.translate(
                      offset: const Offset(0, -24),
                      child: SvgPicture.asset(
                        'packages/schoolap_ui/assets/svgs/trapeze_grid.svg',
                      ),
                    )
                  : SvgPicture.asset(
                      'packages/schoolap_ui/assets/svgs/trapeze_grid.svg',
                    ),
            ),
          // Variant content
          switch (_variant) {
            _SPAppBarVariant.standard => _buildStandard(context, theme),
            _SPAppBarVariant.landscape => _buildLandscape(context, theme),
            _SPAppBarVariant.main => _buildMain(context, theme),
          },
        ],
      ),
    );
  }

  // ── Layout builders ───────────────────────────────────────────────────────────

  Widget _buildStandard(BuildContext context, AppThemeData theme) {
    final topPadding = MediaQuery.of(context).padding.top;
    final canGoBack =
        automaticallyImplyLeading && Navigator.of(context).canPop();

    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Centered title (padded so it never overlaps side buttons)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 8),
            child: Align(
              alignment: Alignment.center,
              child: titleWidget ??
                  SPText.title2(
                    titleText ?? '',
                    style: TextStyle(color: theme.colors.white),
                    textAlign: TextAlign.center,
                  ),
            ),
          ),
          // Leading: custom widget or auto back button
          if (canGoBack || leading != null)
            Align(
              alignment: Alignment.centerLeft,
              child: leading ??
                  IconButton(
                    onPressed:
                        onLeadingTap ?? () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back),
                    color: theme.colors.white,
                  ),
            ),
          // Trailing
          if (trailing != null)
            Align(
              alignment: Alignment.centerRight,
              child: trailing!,
            ),
        ],
      ),
    );
  }

  Widget _buildLandscape(BuildContext context, AppThemeData theme) {
    final canGoBack =
        automaticallyImplyLeading && Navigator.of(context).canPop();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Back button
            if (canGoBack)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: _RoundedBackButton(
                  onTap: onLeadingTap ?? () => Navigator.of(context).pop(),
                ),
              ),
            // Custom leading widget
            if (leading != null) leading!,
            // Title (expands to fill remaining space)
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: titleWidget ??
                    (titleText != null
                        ? SPText.title2(
                            titleText!,
                            style: TextStyle(color: theme.colors.white),
                            textAlign: TextAlign.center,
                          )
                        : const SizedBox.shrink()),
              ),
            ),
            // Trailing
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }

  Widget _buildMain(BuildContext context, AppThemeData theme) {
    final notif = notification ?? const SPAppBarNotification(show: false);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                // Logo: custom widget or default Schoolap pen + name pair
                if (logo != null)
                  logo!
                else ...[
                  Image.asset(
                    'packages/schoolap_ui/assets/images/logo_schoolap_pen.png',
                  ),
                  const SizedBox(width: 5),
                  Transform.translate(
                    offset: const Offset(0, -3),
                    child: Image.asset(
                      'packages/schoolap_ui/assets/images/logo_schoolap_name.png',
                    ),
                  ),
                ],
                const Spacer(),
                // Notification bell
                if (notif.show)
                  Badge(
                    backgroundColor:
                        theme.colors.white.withAlpha((255 * 0.7).toInt()),
                    label: Text(
                      notif.badgeLabel ?? '',
                      style: TextStyle(color: theme.colors.blue),
                    ),
                    isLabelVisible: notif.showBadge,
                    child: SPButtonIcon(
                      iconData: AppIconsData.bellSimple,
                      iconSize: 25,
                      height: 40,
                      width: 40,
                      filledColor:
                          theme.colors.white.withAlpha((255 * 0.2).toInt()),
                      shape: ButtonIconShape.circle,
                      showBadge: false,
                      onPressed: notif.onTap,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            // Body content
            if (bottom != null) bottom!,
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Private helpers
// ─────────────────────────────────────────────────────────────────────────────

class _RoundedBackButton extends StatelessWidget {
  const _RoundedBackButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        decoration: ShapeDecoration(
          color: Colors.white.withAlpha((255 * 0.2).toInt()),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(theme.radius.small),
          ),
        ),
        child: const Icon(Icons.arrow_back, color: Colors.white),
      ),
    );
  }
}
