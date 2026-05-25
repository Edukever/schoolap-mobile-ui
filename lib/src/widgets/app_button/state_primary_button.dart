part of '../widget.dart';

@Deprecated(
  'Use SPButtonPreset named constructors instead.\n'
  'Migration guide:\n'
  '  SPButtonStatePrimaryState.download   → SPButtonPreset.download(...)\n'
  '  SPButtonStatePrimaryState.validation → SPButtonPreset.danger(...)\n'
  '  SPButtonStatePrimaryState.delete     → SPButtonPreset.success(...)\n'
  '  SPButtonStatePrimaryState.disabled   → SPButton(..., onPressed: null)\n'
  'Will be removed in a future version.',
)
enum SPButtonStatePrimaryState { download, validation, delete, disabled }

@Deprecated(
  'Use SPButtonPreset instead.\n'
  'Migration guide:\n'
  '  SPButtonStatePrimary(state: SPButtonStatePrimaryState.download)   → SPButtonPreset.download()\n'
  '  SPButtonStatePrimary(state: SPButtonStatePrimaryState.validation) → SPButtonPreset.danger()\n'
  '  SPButtonStatePrimary(state: SPButtonStatePrimaryState.delete)     → SPButtonPreset.success()\n'
  'Will be removed in a future version.',
)
class SPButtonStatePrimary extends StatelessWidget {
  // ignore: deprecated_member_use_from_same_package
  const SPButtonStatePrimary({
    super.key,
    required this.state,
    this.width,
    this.iconPosition,
    this.onPressed,
  });

  // ignore: deprecated_member_use_from_same_package
  final SPButtonStatePrimaryState state;
  final double? width;
  // ignore: deprecated_member_use_from_same_package
  final IconPosition? iconPosition;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use_from_same_package
    return switch (state) {
      // ignore: deprecated_member_use_from_same_package
      SPButtonStatePrimaryState.download =>
        SPButtonPreset.download(onPressed: onPressed, width: width),
      // ignore: deprecated_member_use_from_same_package
      SPButtonStatePrimaryState.validation =>
        SPButtonPreset.danger(onPressed: onPressed, width: width),
      // ignore: deprecated_member_use_from_same_package
      SPButtonStatePrimaryState.delete =>
        SPButtonPreset.success(onPressed: onPressed, width: width),
      // ignore: deprecated_member_use_from_same_package
      SPButtonStatePrimaryState.disabled =>
        SPButton('Désactivé', onPressed: null, width: width,
            color: const Color(0xFFBDBDBD)),
    };
  }
}
