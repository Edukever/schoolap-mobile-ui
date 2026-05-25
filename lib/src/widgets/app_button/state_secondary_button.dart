part of '../widget.dart';

@Deprecated(
  'Use SPButtonPreset with soft: true instead.\n'
  'Migration guide:\n'
  '  SPButtonSecondaryState(state: SPButtonStatePrimaryState.download)   → SPButtonPreset.download(soft: true)\n'
  '  SPButtonSecondaryState(state: SPButtonStatePrimaryState.validation) → SPButtonPreset.danger(soft: true)\n'
  '  SPButtonSecondaryState(state: SPButtonStatePrimaryState.delete)     → SPButtonPreset.success(soft: true)\n'
  '  label: parameter stays the same on SPButtonPreset.\n'
  'Will be removed in a future version.',
)
class SPButtonSecondaryState extends StatelessWidget {
  // ignore: deprecated_member_use_from_same_package
  const SPButtonSecondaryState({
    super.key,
    required this.state,
    this.label,
    this.icon,
    this.width,
    this.fontSize,
    this.iconPosition,
    this.onPressed,
  });

  // ignore: deprecated_member_use_from_same_package
  final SPButtonStatePrimaryState state;
  final String? label;
  final Widget? icon;
  final double? width;
  final double? fontSize;
  // ignore: deprecated_member_use_from_same_package
  final IconPosition? iconPosition;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use_from_same_package
    return switch (state) {
      // ignore: deprecated_member_use_from_same_package
      SPButtonStatePrimaryState.download =>
        SPButtonPreset.download(label: label, onPressed: onPressed, width: width, soft: true),
      // ignore: deprecated_member_use_from_same_package
      SPButtonStatePrimaryState.validation =>
        SPButtonPreset.danger(label: label, onPressed: onPressed, width: width, soft: true),
      // ignore: deprecated_member_use_from_same_package
      SPButtonStatePrimaryState.delete =>
        SPButtonPreset.success(label: label, onPressed: onPressed, width: width, soft: true),
      _ => const SizedBox.shrink(),
    };
  }
}
