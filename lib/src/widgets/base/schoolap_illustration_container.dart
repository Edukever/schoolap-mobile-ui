part of '../widget.dart';

class SPIllustrationContainer extends StatelessWidget {
  final Illustration illustration;
  final String label;
  final double? width;
  final double? height;
  final Color? color;

  const SPIllustrationContainer({
    super.key,
    required this.illustration,
    required this.label,
    this.height,
    this.width,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (illustration.type == IllustrationType.image)
          Image.asset(
            illustration.path,
            height: height,
            width: width,
            color: color,
          ),
        if (illustration.type == IllustrationType.svg)
          SvgPicture.asset(
            illustration.path,
            height: height,
            width: width,
            colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
          ),
        const SizedBox(height: 20.0),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 200),
          child: SPText.paragraph1(label),
        ),
      ],
    );
  }
}
