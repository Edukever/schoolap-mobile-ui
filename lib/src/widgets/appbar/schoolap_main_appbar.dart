part of '../widget.dart';

class SPMainAppbar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Widget child;
  final bool showNotificationIcon;
  final bool showNotificationBadge;
  final String? badgeLabel;
  final Widget? leading;
  final bool shadow;
  final VoidCallback? onNotificationTap;
  final BorderRadiusGeometry? borderRadius;

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
          borderRadius:  borderRadius ?? BorderRadius.only(
            bottomLeft: AppTheme.of(context).radius.big,
            bottomRight: AppTheme.of(context).radius.big,
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
            Positioned(
              top: 0,
              right: 0,
              child: SvgPicture.asset('packages/schoolap_ui/assets/svgs/trapeze_grid.svg'),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        if (leading != null)
                          leading!
                        else ...[
                          Image.asset('packages/schoolap_ui/assets/images/logo_schoolap_pen.png'),
                          const SizedBox(width: 5.0),
                          Transform.translate(
                            offset: const Offset(0, -3),
                            child: Image.asset('packages/schoolap_ui/assets/images/logo_schoolap_name.png'),
                          ),
                        ],
                        const Spacer(),
                        if (showNotificationIcon)
                          Badge(
                            backgroundColor: AppTheme.of(context).colors.blanc.withOpacity(.7),
                            label: Text(
                              badgeLabel ?? '',
                              style: TextStyle(color: AppTheme.of(context).colors.bleu),
                            ),
                            isLabelVisible: showNotificationBadge,
                            child: SPButtonIcon(
                              iconData: AppIconsData.bellSimple,
                              iconSize: 25.0,
                              height: 40,
                              width: 40,
                              filledColor: AppTheme.of(context).colors.blanc.withOpacity(0.2),
                              shape: ButtonIconShape.circle,
                              showBadge: false,
                              onPressed: onNotificationTap,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    child,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
