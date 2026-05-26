import 'package:flutter/material.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

import '../widgets/code_preview.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Scaffold(
      appBar: AppBar(title: const SPText('SPButton')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(theme.spacing.large),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Filled ────────────────────────────────────────────────────
            _Section(label: 'Filled (default)', children: [
              CodePreview(
                code: "SPButton('Suivant')",
                child: SPButton('Suivant'),
              ),
              CodePreview(
                code: '''
SPButton(
  'Avec icône à gauche',
  leading: Icon(Icons.arrow_back, color: Colors.white, size: 18),
)''',
                child: SPButton(
                  'Avec icône à gauche',
                  leading: const Icon(Icons.arrow_back, color: Colors.white, size: 18),
                ),
              ),
              CodePreview(
                code: '''
SPButton(
  'Avec icône à droite',
  trailing: Icon(Icons.arrow_forward, color: Colors.white, size: 18),
)''',
                child: SPButton(
                  'Avec icône à droite',
                  trailing: const Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                ),
              ),
            ]),
            SizedBox(height: theme.spacing.large),

            // ── Outlined ──────────────────────────────────────────────────
            _Section(label: 'Outlined', children: [
              CodePreview(
                code: '''
SPButton.outlined(
  'Retour',
  foregroundColor: theme.colors.orange,
  borderColor: theme.colors.orange,
)''',
                child: SPButton.outlined(
                  'Retour',
                  foregroundColor: theme.colors.orange,
                  borderColor: theme.colors.orange,
                ),
              ),
              CodePreview(
                code: '''
SPButton.outlined(
  'Retour avec icône',
  foregroundColor: theme.colors.orange,
  borderColor: theme.colors.orange,
  leading: Icon(Icons.arrow_back, color: theme.colors.orange, size: 18),
)''',
                child: SPButton.outlined(
                  'Retour avec icône',
                  foregroundColor: theme.colors.orange,
                  borderColor: theme.colors.orange,
                  leading: Icon(Icons.arrow_back, color: theme.colors.orange, size: 18),
                ),
              ),
            ]),
            SizedBox(height: theme.spacing.large),

            // ── Presets — solid ───────────────────────────────────────────
            _Section(label: 'Presets — solid', children: [
              CodePreview(
                code: "SPButtonPreset.download(width: double.infinity)",
                child: SPButtonPreset.download(width: double.infinity),
              ),
              CodePreview(
                code: "SPButtonPreset.danger(width: double.infinity)",
                child: SPButtonPreset.danger(width: double.infinity),
              ),
              CodePreview(
                code: "SPButtonPreset.success(width: double.infinity)",
                child: SPButtonPreset.success(width: double.infinity),
              ),
            ]),
            SizedBox(height: theme.spacing.large),

            // ── Presets — soft ────────────────────────────────────────────
            _Section(label: 'Presets — soft', children: [
              CodePreview(
                code: "SPButtonPreset.download(width: double.infinity, soft: true)",
                child: SPButtonPreset.download(width: double.infinity, soft: true),
              ),
              CodePreview(
                code: "SPButtonPreset.danger(width: double.infinity, soft: true)",
                child: SPButtonPreset.danger(width: double.infinity, soft: true),
              ),
              CodePreview(
                code: "SPButtonPreset.success(width: double.infinity, soft: true)",
                child: SPButtonPreset.success(width: double.infinity, soft: true),
              ),
            ]),
            SizedBox(height: theme.spacing.large),

            // ── Custom label ──────────────────────────────────────────────
            _Section(label: 'Preset — custom label', children: [
              CodePreview(
                code: '''
SPButtonPreset.danger(
  label: "Exclure l'élève",
  width: double.infinity,
)''',
                child: SPButtonPreset.danger(
                  label: "Exclure l'élève",
                  width: double.infinity,
                ),
              ),
              CodePreview(
                code: '''
SPButtonPreset.success(
  label: 'Marquer comme présent',
  width: double.infinity,
  soft: true,
)''',
                child: SPButtonPreset.success(
                  label: 'Marquer comme présent',
                  width: double.infinity,
                  soft: true,
                ),
              ),
            ]),
            SizedBox(height: theme.spacing.large),

            // ── SPButtonIcon ──────────────────────────────────────────────
            _Section(label: 'SPButtonIcon — formes', children: [
              CodePreview(
                code: r'''
SPButtonIcon(AppIconsData.date)
SPButtonIcon.square(AppIconsData.date)
SPButtonIcon.square(AppIconsData.date, hasShadow: true)
SPButtonIcon.circle(AppIconsData.date)
SPButtonIcon.outlined(
  AppIconsData.date,
  outlinedColor: Colors.orange,
  iconColor: Colors.orange,
)''',
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    const SPButtonIcon(AppIconsData.date),
                    const SPButtonIcon.square(AppIconsData.date),
                    const SPButtonIcon.square(AppIconsData.date, hasShadow: true),
                    const SPButtonIcon.circle(AppIconsData.date),
                    const SPButtonIcon.outlined(
                      AppIconsData.date,
                      outlinedColor: Colors.orange,
                      iconColor: Colors.orange,
                    ),
                  ],
                ),
              ),
            ]),
            SizedBox(height: theme.spacing.large),

            _Section(label: 'SPButtonIcon — taille & couleur', children: [
              CodePreview(
                code: r'''
SPButtonIcon.square(
  AppIconsData.date,
  width: 40,
  height: 40,
  iconSize: 18,
  color: theme.colors.blue,
)
SPButtonIcon.circle(
  AppIconsData.date,
  width: 40,
  height: 40,
  iconSize: 18,
  color: theme.colors.blueLight,
  iconColor: theme.colors.blue,
)''',
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    SPButtonIcon.square(
                      AppIconsData.date,
                      width: 40,
                      height: 40,
                      iconSize: 18,
                      color: theme.colors.blue,
                    ),
                    SPButtonIcon.circle(
                      AppIconsData.date,
                      width: 40,
                      height: 40,
                      iconSize: 18,
                      color: theme.colors.blueLight,
                      iconColor: theme.colors.blue,
                    ),
                  ],
                ),
              ),
            ]),
            SizedBox(height: theme.spacing.large),

            _Section(label: 'SPButtonIcon — badge', children: [
              CodePreview(
                code: r'''
SPButtonIcon.square(
  AppIconsData.bellSimple,
  showBadge: true,
  badgeLabel: Text('3'),
)
SPButtonIcon.circle(
  AppIconsData.bellSimple,
  showBadge: true,
)''',
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    SPButtonIcon.square(
                      AppIconsData.bellSimple,
                      showBadge: true,
                      badgeLabel: const Text('3'),
                    ),
                    const SPButtonIcon.circle(
                      AppIconsData.bellSimple,
                      showBadge: true,
                    ),
                  ],
                ),
              ),
            ]),
            SizedBox(height: theme.spacing.extraLarge),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.label, required this.children});
  final String label;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SPText.label(
          label.toUpperCase(),
          style: TextStyle(color: theme.colors.gray2, letterSpacing: 1.1),
        ),
        SizedBox(height: theme.spacing.small),
        ...children.expand((child) => [child, SizedBox(height: theme.spacing.small)]),
      ],
    );
  }
}
