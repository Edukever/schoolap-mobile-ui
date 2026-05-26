part of '../widget.dart';

class SPIllustrationContainer extends StatelessWidget {
  const SPIllustrationContainer({
    super.key,
    required this.illustration,
    required this.label,
    this.height,
    this.width,
    this.color,
  });

  final Illustration illustration;
  final String label;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final image = switch (illustration.type) {
      IllustrationType.image => Image.asset(
          illustration.path,
          height: height,
          width: width,
          color: color,
        ),
      IllustrationType.svg => SvgPicture.asset(
          illustration.path,
          height: height,
          width: width,
          colorFilter:
              color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        ),
    };

    return Column(
      children: [
        image,
        const SizedBox(height: 20),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 200),
          child: SPText.paragraph1(label),
        ),
      ],
    );
  }
}
