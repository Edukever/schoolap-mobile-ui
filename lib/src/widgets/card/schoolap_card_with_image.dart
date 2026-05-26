part of '../widget.dart';

class SPCardWithImage extends StatelessWidget {
  const SPCardWithImage({
    super.key,
    required this.label,
    required this.image,
    this.imageHeight = 90,
    this.width = 120,
    this.height = 150,
    this.onTap,
  });

  final String label;

  /// Image painted in the upper area of the card.
  /// Use [AssetImage] for local assets or [NetworkImage] for remote URLs.
  final ImageProvider image;

  final double imageHeight;
  final double width;
  final double height;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SPCard(
      onTap: onTap,
      backgroundColor: Colors.white,
      constraints: BoxConstraints.tight(Size(width, height)),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              height: imageHeight,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(AppTheme.of(context).radius.medium),
                image: DecorationImage(fit: BoxFit.cover, image: image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
              child: AutoSizeText(
                label,
                style: const TextStyle(
                  color: Color(0xFF292D32),
                  fontSize: 13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
