part of '../widget.dart';

class SPMainAppbar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Widget child;
  final bool showNotificationIcon;
  final bool showNotificationBadge;
  final Widget? notificationBadgeLabel;

  const SPMainAppbar({
    super.key,
    required this.height,
    required this.child,
    this.showNotificationIcon = true,
    this.showNotificationBadge = false,
    this.notificationBadgeLabel,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.of(context).colors.bleu,
          borderRadius: BorderRadius.only(
            bottomLeft: AppTheme.of(context).radius.big,
            bottomRight: AppTheme.of(context).radius.big,
          ),
        ),
        child: Stack(children: [
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset('packages/schoolap_ui/assets/svgs/trapeze_grid.svg'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset('packages/schoolap_ui/assets/images/logo_schoolap_pen.png'),
                    const SizedBox(width: 5.0),
                    Transform.translate(
                      offset: const Offset(0, -3),
                      child: Image.asset('packages/schoolap_ui/assets/images/logo_schoolap_name.png'),
                    ),
                    const Spacer(),
                    if (showNotificationIcon)
                      SPButtonIcon(
                        iconData: 'packages/schoolap_ui/assets/icons/bell_simple.svg',
                        iconSize: 25.0,
                        height: 40,
                        width: 40,
                        filledColors: AppTheme.of(context).colors.blanc.withOpacity(0.2),
                        shape: ButtonIconShape.circle,
                        showBadge: showNotificationBadge,
                        badgeLabel: notificationBadgeLabel,
                      ),
                  ],
                ),
                const SizedBox(height: 20.0),
                child,
              ],
            ),
          )
        ]),
      ),
    );
  }
}
