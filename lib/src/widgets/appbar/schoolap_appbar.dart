part of '../widget.dart';

class SPAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final Widget? titleWidget;
  final bool hidePop;
  final Color? backgroundColor;

  const SPAppBar({
    super.key,
    this.height = 80,
    required this.title,
    this.titleWidget,
    this.hidePop = false,
    this.backgroundColor,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? AppTheme.of(context).colors.blue,
          borderRadius: BorderRadius.only(
            bottomLeft: AppTheme.of(context).radius.full,
            bottomRight: AppTheme.of(context).radius.full,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Transform.translate(
                offset: const Offset(0, -24),
                child: SvgPicture.asset(
                    'packages/schoolap_ui/assets/svgs/trapeze_grid.svg'),
              ),
            ),
            if (Navigator.of(context).canPop() && !hidePop)
              Padding(
                padding: EdgeInsets.only(top: topPadding),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back),
                    color: AppTheme.of(context).colors.white,
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.only(top: topPadding),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: titleWidget ??
                    SPText.title2(title,
                        color: AppTheme.of(context).colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
