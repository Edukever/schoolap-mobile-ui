part of '../widget.dart';

enum _SPPresetType { download, danger, success }

class SPButtonPreset extends StatelessWidget {
  const SPButtonPreset.download({
    super.key,
    this.label,
    this.onPressed,
    this.leading,
    this.width,
    this.soft = false,
  }) : _type = _SPPresetType.download;

  const SPButtonPreset.danger({
    super.key,
    this.label,
    this.onPressed,
    this.leading,
    this.width,
    this.soft = false,
  }) : _type = _SPPresetType.danger;

  const SPButtonPreset.success({
    super.key,
    this.label,
    this.onPressed,
    this.leading,
    this.width,
    this.soft = false,
  }) : _type = _SPPresetType.success;

  final _SPPresetType _type;
  final String? label;
  final VoidCallback? onPressed;
  final Widget? leading;
  final double? width;

  /// When true, uses a light background with a colored label instead of a
  /// solid filled background — useful for secondary actions on white surfaces.
  final bool soft;

  @override
  Widget build(BuildContext context) {
    final (defaultLabel, solid, softBg, softFg) = switch (_type) {
      _SPPresetType.download => (
          'Télécharger',
          const Color(0xFF41A3DF),
          const Color(0xFFE5F9FF),
          const Color(0xFF41A3DF),
        ),
      _SPPresetType.danger => (
          'Supprimer',
          const Color(0xFFFF4F4F),
          const Color(0xFFFFE1E1),
          const Color(0xFFFF4F4F),
        ),
      _SPPresetType.success => (
          'Valider',
          const Color(0xFF1EA951),
          const Color(0xFFDDF3D6),
          const Color(0xFF1EA951),
        ),
    };

    return SPButton(
      label ?? defaultLabel,
      onPressed: onPressed,
      leading: leading,
      color: soft ? softBg : solid,
      foregroundColor: soft ? softFg : Colors.white,
      width: width,
    );
  }
}
