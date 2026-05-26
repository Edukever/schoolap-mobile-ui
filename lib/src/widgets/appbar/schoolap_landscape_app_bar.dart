part of '../widget.dart';

@Deprecated(
  'Use SPAppBar.landscape instead.\n'
  'Migration guide:\n'
  '  SchoolapLandscapeAppBar(\n'
  '    height: h, leading: w, title: t, trailing: tr,\n'
  '    canPop: true, shadow: true, backgroundColor: c,\n'
  '  )\n'
  '  → SPAppBar.landscape(\n'
  '      height: h, leading: w, titleWidget: t, trailing: tr,\n'
  '      automaticallyImplyLeading: true, shadow: true, backgroundColor: c,\n'
  '    )\n'
  'Will be removed in a future version.',
)
class SchoolapLandscapeAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  // ignore: deprecated_member_use_from_same_package
  const SchoolapLandscapeAppBar({
    super.key,
    required this.height,
    this.shadow = false,
    this.leading,
    this.title,
    this.trailing,
    this.canPop = true,
    this.backgroundColor,
  });

  final double height;
  final bool shadow;
  final Widget? leading;
  final Widget? title;
  final Widget? trailing;
  final bool canPop;
  final Color? backgroundColor;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return SPAppBar.landscape(
      height: height,
      titleWidget: title,
      leading: leading,
      trailing: trailing,
      automaticallyImplyLeading: canPop,
      shadow: shadow,
      backgroundColor: backgroundColor,
    );
  }
}
