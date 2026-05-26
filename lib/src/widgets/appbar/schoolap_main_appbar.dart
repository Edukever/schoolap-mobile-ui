part of '../widget.dart';

@Deprecated(
  'Use SPAppBar.main instead.\n'
  'Migration guide:\n'
  '  SPMainAppbar(\n'
  '    height: h, child: w,\n'
  '    showNotificationIcon: true, showNotificationBadge: true, badgeLabel: "5",\n'
  '    onNotificationTap: fn, leading: l, shadow: true, backgroundColor: c,\n'
  '  )\n'
  '  → SPAppBar.main(\n'
  '      height: h, child: w,\n'
  '      notification: SPAppBarNotification(\n'
  '        show: true, showBadge: true, badgeLabel: "5", onTap: fn,\n'
  '      ),\n'
  '      leading: l, shadow: true, backgroundColor: c,\n'
  '    )\n'
  'Will be removed in a future version.',
)
class SPMainAppbar extends StatelessWidget implements PreferredSizeWidget {
  // ignore: deprecated_member_use_from_same_package
  const SPMainAppbar({
    super.key,
    required this.height,
    required this.child,
    this.showNotificationIcon = true,
    this.showNotificationBadge = false,
    this.badgeLabel,
    this.leading,
    this.shadow = false,
    this.onNotificationTap,
    this.borderRadius,
    this.backgroundColor,
  });

  final double height;
  final Widget child;
  final bool showNotificationIcon;
  final bool showNotificationBadge;
  final String? badgeLabel;
  final Widget? leading;
  final bool shadow;
  final VoidCallback? onNotificationTap;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return SPAppBar.main(
      height: height,
      logo: leading,
      shadow: shadow,
      backgroundColor: backgroundColor,
      notification: SPAppBarNotification(
        show: showNotificationIcon,
        showBadge: showNotificationBadge,
        badgeLabel: badgeLabel,
        onTap: onNotificationTap,
      ),
      child: child,
    );
  }
}
