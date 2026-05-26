import 'package:flutter/material.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

import '../widgets/code_preview.dart';

class AppBarPage extends StatelessWidget {
  const AppBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Scaffold(
      appBar: SPAppBar('SPAppBar'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(theme.spacing.large),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Standard ──────────────────────────────────────────────────
            _Section(label: 'Standard', children: [
              CodePreview(
                code: "SPAppBar('Titre')",
                child: _Preview(
                  height: 70,
                  child: SPAppBar('Titre'),
                ),
              ),
              CodePreview(
                code: '''
SPAppBar(
  'Sans bouton retour',
  automaticallyImplyLeading: false,
)''',
                child: _Preview(
                  height: 70,
                  child: SPAppBar(
                    'Sans bouton retour',
                    automaticallyImplyLeading: false,
                  ),
                ),
              ),
              CodePreview(
                code: '''
SPAppBar(
  'Avec trailing',
  automaticallyImplyLeading: false,
  trailing: IconButton(
    icon: Icon(Icons.more_vert, color: Colors.white),
    onPressed: null,
  ),
)''',
                child: _Preview(
                  height: 70,
                  child: SPAppBar(
                    'Avec trailing',
                    automaticallyImplyLeading: false,
                    trailing: const IconButton(
                      icon: Icon(Icons.more_vert, color: Colors.white),
                      onPressed: null,
                    ),
                  ),
                ),
              ),
              CodePreview(
                code: '''
SPAppBar(
  'Titre personnalisé',
  automaticallyImplyLeading: false,
  titleWidget: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.school, color: Colors.white, size: 18),
      SizedBox(width: 6),
      SPText.title2('Mon école', style: TextStyle(color: Colors.white)),
    ],
  ),
)''',
                child: _Preview(
                  height: 70,
                  child: SPAppBar(
                    'Titre personnalisé',
                    automaticallyImplyLeading: false,
                    titleWidget: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.school, color: Colors.white, size: 18),
                        SizedBox(width: 6),
                        SPText.title2(
                          'Mon école',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CodePreview(
                code: '''
SPAppBar(
  'Apparence',
  automaticallyImplyLeading: false,
  backgroundColor: Color(0xFF5C4DB1),
  bottomRadius: SPAppBarRadius.small,
  shadow: true,
  showGridDecoration: false,
)''',
                child: _Preview(
                  height: 70,
                  child: SPAppBar(
                    'Apparence',
                    automaticallyImplyLeading: false,
                    backgroundColor: const Color(0xFF5C4DB1),
                    bottomRadius: SPAppBarRadius.small,
                    shadow: true,
                    showGridDecoration: false,
                  ),
                ),
              ),
            ]),
            SizedBox(height: theme.spacing.large),

            // ── Landscape ─────────────────────────────────────────────────
            _Section(label: 'Landscape', children: [
              CodePreview(
                code: '''
SPAppBar.landscape(
  title: 'Paysage',
  height: 70,
)''',
                child: _Preview(
                  height: 70,
                  child: SPAppBar.landscape(
                    title: 'Paysage',
                    height: 70,
                  ),
                ),
              ),
              CodePreview(
                code: '''
SPAppBar.landscape(
  title: 'Avec actions',
  height: 70,
  automaticallyImplyLeading: false,
  trailing: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: null),
      IconButton(icon: Icon(Icons.more_vert, color: Colors.white), onPressed: null),
    ],
  ),
)''',
                child: _Preview(
                  height: 70,
                  child: SPAppBar.landscape(
                    title: 'Avec actions',
                    height: 70,
                    automaticallyImplyLeading: false,
                    trailing: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.search, color: Colors.white),
                          onPressed: null,
                        ),
                        IconButton(
                          icon: Icon(Icons.more_vert, color: Colors.white),
                          onPressed: null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CodePreview(
                code: '''
SPAppBar.landscape(
  title: 'Ombre + coins arrondis',
  height: 70,
  automaticallyImplyLeading: false,
  shadow: true,
  bottomRadius: SPAppBarRadius.full,
)''',
                child: _Preview(
                  height: 70,
                  child: SPAppBar.landscape(
                    title: 'Ombre + coins arrondis',
                    height: 70,
                    automaticallyImplyLeading: false,
                    shadow: true,
                    bottomRadius: SPAppBarRadius.full,
                  ),
                ),
              ),
            ]),
            SizedBox(height: theme.spacing.large),

            // ── Main ──────────────────────────────────────────────────────
            _Section(label: 'Main', children: [
              CodePreview(
                code: '''
SPAppBar.main(
  height: 150,
  child: Row(
    children: [
      CircleAvatar(radius: 24),
      SizedBox(width: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SPText.title2('Bonjour, Callie', style: TextStyle(color: Colors.white)),
          SPText.paragraph1('École Saint Marie', style: TextStyle(color: Colors.white70)),
        ],
      ),
    ],
  ),
)''',
                child: _Preview(
                  height: 150,
                  child: SPAppBar.main(
                    height: 150,
                    child: const Row(
                      children: [
                        CircleAvatar(radius: 24),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SPText.title2(
                              'Bonjour, Callie',
                              style: TextStyle(color: Colors.white),
                            ),
                            SPText.paragraph1(
                              'École Saint Marie',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CodePreview(
                code: '''
SPAppBar.main(
  height: 150,
  notification: SPAppBarNotification(
    showBadge: true,
    badgeLabel: '5',
    onTap: () { /* handle tap */ },
  ),
  child: ...,
)''',
                child: _Preview(
                  height: 150,
                  child: SPAppBar.main(
                    height: 150,
                    notification: const SPAppBarNotification(
                      showBadge: true,
                      badgeLabel: '5',
                    ),
                    child: const Row(
                      children: [
                        CircleAvatar(radius: 24),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SPText.title2(
                              'Badge de notification',
                              style: TextStyle(color: Colors.white),
                            ),
                            SPText.paragraph1(
                              'schoolap_ui · SPAppBar.main',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CodePreview(
                code: '''
SPAppBar.main(
  height: 150,
  logo: Row(children: [
    Icon(Icons.school, color: Colors.white, size: 32),
    SizedBox(width: 8),
    SPText.title2('Schoolap', style: TextStyle(color: Colors.white)),
  ]),
  notification: SPAppBarNotification(show: false),
  child: ...,
)''',
                child: _Preview(
                  height: 150,
                  child: SPAppBar.main(
                    height: 150,
                    logo: const Row(
                      children: [
                        Icon(Icons.school, color: Colors.white, size: 32),
                        SizedBox(width: 8),
                        SPText.title2(
                          'Schoolap',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    notification: const SPAppBarNotification(show: false),
                    child: const Row(
                      children: [
                        CircleAvatar(radius: 24),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SPText.title2(
                              'Leading personnalisé',
                              style: TextStyle(color: Colors.white),
                            ),
                            SPText.paragraph1(
                              'Sans cloche de notification',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ],
                    ),
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

// ── Inline appbar preview ─────────────────────────────────────────────────────

/// Renders an [SPAppBar] at a fixed height with no status-bar padding,
/// clipped into rounded corners for display inside a scroll view.
class _Preview extends StatelessWidget {
  const _Preview({required this.height, required this.child});
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return ClipRRect(
      borderRadius: theme.radius.asBorderRadius().medium,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(padding: EdgeInsets.zero),
        child: SizedBox(height: height, child: child),
      ),
    );
  }
}

// ── Section header ────────────────────────────────────────────────────────────

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
        ...children.expand(
          (child) => [child, SizedBox(height: theme.spacing.small)],
        ),
      ],
    );
  }
}
