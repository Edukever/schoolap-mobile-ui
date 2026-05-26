import 'package:flutter/material.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

import '../widgets/code_preview.dart';

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
            // ── Type scale ────────────────────────────────────────────────
            _Section(label: 'Type scale', children: [
              CodePreview(
                code: "SPText.title1('Title 1 — Page hero')",
                child: const SPText.title1('Title 1 — Page hero'),
              ),
              CodePreview(
                code: "SPText.title2('Title 2 — Section heading')",
                child: const SPText.title2('Title 2 — Section heading'),
              ),
              CodePreview(
                code: "SPText.title3('Title 3 — Card title')",
                child: const SPText.title3('Title 3 — Card title'),
              ),
              CodePreview(
                code: "SPText.label('Label — Chip / badge')",
                child: const SPText.label('Label — Chip / badge'),
              ),
              CodePreview(
                code: "SPText.paragraph1('Paragraph 1 — Body copy')",
                child: const SPText.paragraph1('Paragraph 1 — Body copy'),
              ),
              CodePreview(
                code: "SPText.paragraph2('Paragraph 2 — Helper text')",
                child: const SPText.paragraph2('Paragraph 2 — Helper text'),
              ),
            ]),
            SizedBox(height: theme.spacing.large),

            // ── Style overrides ───────────────────────────────────────────
            _Section(label: 'Style overrides', children: [
              CodePreview(
                code: '''
SPText.title2(
  'Colored title',
  style: TextStyle(color: theme.colors.orange),
)''',
                child: SPText.title2(
                  'Colored title',
                  style: TextStyle(color: theme.colors.orange),
                ),
              ),
              CodePreview(
                code: '''
SPText.paragraph1(
  'Semi-bold body in blue',
  style: TextStyle(
    color: theme.colors.blue,
    fontWeight: FontWeight.w600,
  ),
)''',
                child: SPText.paragraph1(
                  'Semi-bold body in blue',
                  style: TextStyle(
                    color: theme.colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              CodePreview(
                code: '''
SPText.paragraph1(
  'Italic note or caption.',
  style: TextStyle(fontStyle: FontStyle.italic),
)''',
                child: const SPText.paragraph1(
                  'Italic note or caption.',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              CodePreview(
                code: '''
SPText.label(
  'UPPERCASE SPACED LABEL',
  style: TextStyle(letterSpacing: 1.5),
)''',
                child: const SPText.label(
                  'UPPERCASE SPACED LABEL',
                  style: TextStyle(letterSpacing: 1.5),
                ),
              ),
              CodePreview(
                code: '''
SPText.paragraph1(
  'Underlined text',
  style: TextStyle(decoration: TextDecoration.underline),
)''',
                child: const SPText.paragraph1(
                  'Underlined text',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ]),
            SizedBox(height: theme.spacing.large),

            // ── Overflow & alignment ──────────────────────────────────────
            _Section(label: 'Overflow & alignment', children: [
              CodePreview(
                code: '''
SPText.paragraph1(
  'This is a very long paragraph that will be truncated '
  'with an ellipsis when it exceeds the maximum number of lines allowed.',
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
)''',
                child: const SPText.paragraph1(
                  'This is a very long paragraph that will be truncated with an ellipsis when it exceeds the maximum number of lines allowed.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              CodePreview(
                code: '''
SPText.title3(
  'Centered heading',
  textAlign: TextAlign.center,
)''',
                child: const SPText.title3(
                  'Centered heading',
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
            SizedBox(height: theme.spacing.large),

            // ── On colored background ─────────────────────────────────────
            _Section(label: 'On colored background', children: [
              CodePreview(
                code: '''
Container(
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
      SPText.paragraph1(
        "Les styles SPText s'adaptent à n'importe quel fond "
        "en passant une couleur via style.",
        style: TextStyle(color: theme.colors.white),
      ),
      SPText.label(
        'schoolap_ui · v0.1.8',
        style: TextStyle(color: theme.colors.white.withAlpha(153)),
      ),
    ],
  ),
)''',
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
                        "Les styles SPText s'adaptent à n'importe quel fond en passant une couleur via style.",
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
