part of '../widget.dart';

class SPAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;

  const SPAppBar({
    super.key,
    this.height = 80,
    required this.title,
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
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Transform.translate(
                offset: const Offset(0, -24),
                child: SvgPicture.asset('packages/schoolap_ui/assets/svgs/trapeze_grid.svg'),
              ),
            ),
            if (Navigator.of(context).canPop()) Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back),
                color: AppTheme.of(context).colors.blanc,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: SPText.title2(title, color: AppTheme.of(context).colors.blanc),
            ),
          ],
        ),
      ),
    );
  }
}
