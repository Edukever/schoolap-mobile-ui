part of '../widget.dart';

class DotContainer extends StatelessWidget {
  const DotContainer({
    super.key,
    required this.color,
    this.size,
  });

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 10,
      width: size ?? 10,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
