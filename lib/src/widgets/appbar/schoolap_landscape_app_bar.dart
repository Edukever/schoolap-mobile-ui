part of '../widget.dart';

class SchoolapLandscapeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final bool shadow;
  final Widget? leading;
  final Widget? title;
  final Widget? trailing;
  final bool canPop;
  final Color? backgroundColor;

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

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppTheme.of(context).colors.bleu,
          borderRadius: BorderRadius.only(
            bottomLeft: AppTheme.of(context).radius.regular,
            bottomRight: AppTheme.of(context).radius.regular,
          ),
          boxShadow: shadow
              ? [
                  const BoxShadow(
                    color: Color.fromRGBO(185, 212, 208, 0.87),
                    offset: Offset(0, 6),
                    blurRadius: 15,
                  ),
                ]
              : null,
        ),
        child: Stack(
          children: [
            _buildBackgroundDecoration(),
            SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildLeading(context),
                  title ?? const SizedBox.shrink(),
                  trailing ?? const SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundDecoration() {
    return Positioned(
      top: 0,
      right: 0,
      child: SvgPicture.asset('packages/schoolap_ui/assets/svgs/trapeze_grid.svg'),
    );
  }

  Widget _buildLeading(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 50),
        if (canPop)
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: 45,
              height: 45,
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(9),
                    bottomRight: Radius.circular(8),
                  ),
                ),
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        leading ?? const SizedBox.shrink(),
      ],
    );
  }
}
