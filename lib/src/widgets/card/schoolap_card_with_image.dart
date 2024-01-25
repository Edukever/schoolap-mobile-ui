part of '../widget.dart';

class SPCardWithImage extends StatelessWidget {
  final String label;
  final String imagePath;
  final VoidCallback? onTap;
  const SPCardWithImage({
    super.key,
    required this.label,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SPCard(
      onTap: onTap,
      backgroundColor: Colors.white,
      constraints: const BoxConstraints(
        maxWidth: 120,
        maxHeight: 150,
        minHeight: 150,
        minWidth: 120,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imagePath),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
              child: Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF292D32),
                  fontSize: 13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
