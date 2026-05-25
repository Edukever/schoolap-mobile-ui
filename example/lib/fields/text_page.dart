import 'package:flutter/material.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('SPText — Type Scale')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(theme.spacing.large),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Section(
              label: 'Type scale',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Row(
                    name: '.title1',
                    detail: '28px · bold',
                    child: const SPText.title1('Title 1 — Page hero'),
                  ),
                  _Row(
                    name: '.title2',
                    detail: '18px · bold',
                    child: const SPText.title2('Title 2 — Section heading'),
                  ),
                  _Row(
                    name: '.title3',
                    detail: '14px · bold',
                    child: const SPText.title3('Title 3 — Card title'),
                  ),
                  _Row(
                    name: '.label',
                    detail: '11px · w500',
                    child: const SPText.label('Label — Chip / badge'),
                  ),
                  _Row(
                    name: '.paragraph1',
                    detail: '12px · w400',
                    child: const SPText.paragraph1('Paragraph 1 — Body copy'),
                  ),
                  _Row(
                    name: '.paragraph2',
                    detail: '10px · w400',
                    child: const SPText.paragraph2('Paragraph 2 — Helper text'),
                  ),
                ],
              ),
            ),
            SizedBox(height: theme.spacing.large),
            _Section(
              label: 'Style overrides',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Row(
                    name: 'color',
                    child: SPText.title2(
                      'Colored title',
                      style: TextStyle(color: theme.colors.orange),
                    ),
                  ),
                  _Row(
                    name: 'color + weight',
                    child: SPText.paragraph1(
                      'Semi-bold body in blue',
                      style: TextStyle(
                        color: theme.colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  _Row(
                    name: 'italic',
                    child: const SPText.paragraph1(
                      'Italic note or caption.',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  _Row(
                    name: 'letterSpacing',
                    child: const SPText.label(
                      'UPPERCASE SPACED LABEL',
                      style: TextStyle(letterSpacing: 1.5),
                    ),
                  ),
                  _Row(
                    name: 'decoration',
                    child: const SPText.paragraph1(
                      'Underlined text',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: theme.spacing.large),
            _Section(
              label: 'Overflow & alignment',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Row(
                    name: 'maxLines + ellipsis',
                    child: const SPText.paragraph1(
                      'This is a very long paragraph that will be truncated with an ellipsis when it exceeds the maximum number of lines allowed.',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  _Row(
                    name: 'center',
                    child: const SPText.title3(
                      'Centered heading',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: theme.spacing.large),
            _Section(
              label: 'On colored background',
              child: Container(
                padding: EdgeInsets.all(theme.spacing.medium),
                decoration: BoxDecoration(
                  color: theme.colors.blue,
                  borderRadius: theme.radius.asBorderRadius().medium,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SPText.title2(
                      'Titre sur fond coloré',
                      style: TextStyle(color: theme.colors.white),
                    ),
                    SizedBox(height: theme.spacing.small),
                    SPText.paragraph1(
                      'Les styles SPText s\'adaptent à n\'importe quel fond en passant une couleur via style.',
                      style: TextStyle(color: theme.colors.white),
                    ),
                    SizedBox(height: theme.spacing.extraSmall),
                    SPText.label(
                      'schoolap_ui · v0.1.8',
                      style: TextStyle(
                        color: theme.colors.white.withAlpha((255 * 0.6).toInt()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: theme.spacing.extraLarge),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.label, required this.child});
  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SPText.label(
          label.toUpperCase(),
          style: TextStyle(
            color: theme.colors.gray2,
            letterSpacing: 1.1,
          ),
        ),
        SizedBox(height: theme.spacing.small),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(theme.spacing.medium),
          decoration: BoxDecoration(
            border: Border.all(color: theme.colors.gray2.withAlpha(60)),
            borderRadius: theme.radius.asBorderRadius().medium,
          ),
          child: child,
        ),
      ],
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.child, required this.name, this.detail});
  final String name;
  final String? detail;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: theme.spacing.extraSmall),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 120,
            child: SPText.paragraph2(
              name,
              style: TextStyle(
                color: theme.colors.gray2,
                fontFamily: 'monospace',
              ),
            ),
          ),
          Expanded(child: child),
          if (detail != null) ...[
            SizedBox(width: theme.spacing.small),
            SPText.paragraph2(
              detail!,
              style: TextStyle(color: theme.colors.gray2),
            ),
          ],
        ],
      ),
    );
  }
}
