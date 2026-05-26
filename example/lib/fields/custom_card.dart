import 'package:flutter/material.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

import '../widgets/code_preview.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Scaffold(
      appBar: SPAppBar('Cartes'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(theme.spacing.large),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── SPCardTile ───────────────────────────────────────────────────
            _Section(
              label: 'SPCardTile — Basique',
              description: 'Tuile avec avatar, titre et sous-titre.',
              child: CodePreview(
                code: r'''
SPCardTile(
  title: 'Alice Martin',
  subtitle: 'Mathématiques · 11 déc. 2023',
  subtitleColor: Color(0xFF41A3DF),
)''',
                child: SPCardTile(
                  title: 'Alice Martin',
                  subtitle: 'Mathématiques · 11 déc. 2023',
                  subtitleColor: const Color(0xFF41A3DF),
                ),
              ),
            ),
            SizedBox(height: theme.spacing.large),

            _Section(
              label: 'SPCardTile — bottom',
              description: 'Widget supplémentaire sous le sous-titre via bottom.',
              child: CodePreview(
                code: r'''
SPCardTile(
  title: 'Rapport de présence',
  subtitle: '11 décembre 2023 à 09:22',
  subtitleColor: Color(0xFF41A3DF),
  bottom: Padding(
    padding: EdgeInsets.only(top: 8),
    child: _AttendanceBadge(label: '26/28'),
  ),
)''',
                child: SPCardTile(
                  title: 'Rapport de présence',
                  subtitle: '11 décembre 2023 à 09:22',
                  subtitleColor: const Color(0xFF41A3DF),
                  bottom: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: _AttendanceBadge(label: '26/28'),
                  ),
                ),
              ),
            ),
            SizedBox(height: theme.spacing.large),

            _Section(
              label: 'SPCardTile — overlay',
              description: 'Contenu flottant via overlay (Stack + Positioned).',
              child: CodePreview(
                code: r'''
SPCardTile(
  title: 'Titre du communiqué',
  subtitle: '11 décembre 2023 à 09:22',
  subtitleColor: Color(0xFF41A3DF),
  leading: const SizedBox.shrink(),
  overlay: Positioned(
    top: -10,
    right: 0,
    child: _TimeBadge(time: '9h45'),
  ),
)''',
                child: SPCardTile(
                  title: 'Titre du communiqué',
                  subtitle: '11 décembre 2023 à 09:22',
                  subtitleColor: const Color(0xFF41A3DF),
                  leading: const SizedBox.shrink(),
                  overlay: Positioned(
                    top: -10,
                    right: 0,
                    child: _TimeBadge(time: '9h45'),
                  ),
                ),
              ),
            ),
            SizedBox(height: theme.spacing.large),

            _Section(
              label: 'SPCardTile — trailing',
              description: 'Widget aligné à droite de la ligne via trailing.',
              child: CodePreview(
                code: r'''
SPCardTile(
  title: 'Alice Martin',
  subtitle: 'Présente',
  subtitleColor: Color(0xFF1EA951),
  trailing: Icon(
    Icons.check_circle_outline,
    color: Color(0xFF1EA951),
  ),
)''',
                child: SPCardTile(
                  title: 'Alice Martin',
                  subtitle: 'Présente',
                  subtitleColor: const Color(0xFF1EA951),
                  trailing: const Icon(
                    Icons.check_circle_outline,
                    color: Color(0xFF1EA951),
                  ),
                ),
              ),
            ),
            SizedBox(height: theme.spacing.extraLarge),

            // ── SPCardAlert ──────────────────────────────────────────────────
            _Section(
              label: 'SPCardAlert',
              description: 'Quatre types : alert, warning, info, success.',
              child: CodePreview(
                code: '''
SPCardAlert(
  type: SPCardAlertType.alert,
  title: "Erreur lors de l'envoi du formulaire.",
)

SPCardAlert(
  type: SPCardAlertType.warning,
  title: 'Connexion instable. Certaines données peuvent être incomplètes.',
)

SPCardAlert(
  type: SPCardAlertType.info,
  title: 'Votre rapport a été envoyé avec succès.',
)

SPCardAlert(
  type: SPCardAlertType.success,
  title: 'Présences enregistrées pour toute la classe.',
)''',
                child: Column(
                  children: [
                    const SPCardAlert(
                      type: SPCardAlertType.alert,
                      title: "Erreur lors de l'envoi du formulaire.",
                    ),
                    SizedBox(height: theme.spacing.small),
                    const SPCardAlert(
                      type: SPCardAlertType.warning,
                      title: 'Connexion instable. Certaines données peuvent être incomplètes.',
                    ),
                    SizedBox(height: theme.spacing.small),
                    const SPCardAlert(
                      type: SPCardAlertType.info,
                      title: 'Votre rapport a été envoyé avec succès.',
                    ),
                    SizedBox(height: theme.spacing.small),
                    const SPCardAlert(
                      type: SPCardAlertType.success,
                      title: 'Présences enregistrées pour toute la classe.',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: theme.spacing.large),

            _Section(
              label: 'SPCardAlert — icône personnalisée',
              description: 'Remplacez l\'icône par défaut via icon.',
              child: CodePreview(
                code: r'''
SPCardAlert(
  type: SPCardAlertType.info,
  title: '3 élèves en retard aujourd\'hui.',
  icon: Icon(Icons.access_time_rounded, color: Color(0xFF1EA951)),
)''',
                child: SPCardAlert(
                  type: SPCardAlertType.info,
                  title: "3 élèves en retard aujourd'hui.",
                  icon: const Icon(
                    Icons.access_time_rounded,
                    color: Color(0xFF1EA951),
                  ),
                ),
              ),
            ),
            SizedBox(height: theme.spacing.extraLarge),

            // ── SPCardPresence ───────────────────────────────────────────────
            _Section(
              label: 'SPCardPresence',
              description: 'Carte compact affichant un compteur de présence ou d\'absence.',
              child: CodePreview(
                code: r'''
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    SPCardPresence(
      type: SPCardPresenceType.presence,
      value: '26',
    ),
    SPCardPresence(
      type: SPCardPresenceType.absence,
      value: '2',
    ),
  ],
)''',
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SPCardPresence(
                      type: SPCardPresenceType.presence,
                      value: '26',
                    ),
                    SPCardPresence(
                      type: SPCardPresenceType.absence,
                      value: '2',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: theme.spacing.extraLarge),

            // ── SPCardWithImage ──────────────────────────────────────────────
            _Section(
              label: 'SPCardWithImage',
              description: 'Carte avec image en haut et label en bas.',
              child: CodePreview(
                code: r'''
SPCardWithImage(
  label: 'Écrire un communiqué',
  image: AssetImage('assets/images/pen.png'),
)

// Réseau
SPCardWithImage(
  label: 'Photo de classe',
  image: NetworkImage('https://example.com/photo.jpg'),
  width: 140,
  height: 170,
  imageHeight: 110,
)''',
                child: Wrap(
                  spacing: theme.spacing.medium,
                  runSpacing: theme.spacing.medium,
                  children: const [
                    SPCardWithImage(
                      label: 'Écrire un communiqué',
                      image: AssetImage('assets/images/pen.png'),
                    ),
                    SPCardWithImage(
                      label: 'Cahier de texte',
                      image: AssetImage('assets/images/pen.png'),
                      width: 140,
                      height: 170,
                      imageHeight: 110,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: theme.spacing.extraLarge),

            // ── SPPopMenuButton ──────────────────────────────────────────────
            _Section(
              label: 'SPPopMenuButton',
              description: 'Menu contextuel en overlay déclenché par une icône.',
              child: CodePreview(
                code: r'''
SPPopMenuButton<String>(
  iconPath: AppIconsData.classe,
  iconColor: theme.colors.blue,
  handleIconTap: (value) {
    // handle action
  },
  items: const [
    SPListItem(
      value: 'update',
      label: 'Modifier',
      iconPath: AppIconsData.modifier,
    ),
    SPListItem(
      value: 'detail',
      label: 'Détail',
      iconPath: AppIconsData.detail,
    ),
    SPListItem(
      value: 'archiver',
      label: 'Archiver',
      iconPath: AppIconsData.archiver,
    ),
  ],
)''',
                child: Row(
                  children: [
                    const Spacer(),
                    SPText.paragraph2(
                      'Appuyer sur l\'icône →',
                      style: TextStyle(color: theme.colors.gray2),
                    ),
                    SPPopMenuButton<String>(
                      iconPath: AppIconsData.classe,
                      iconColor: theme.colors.blue,
                      handleIconTap: (value) {},
                      items: const [
                        SPListItem(
                          value: 'update',
                          label: 'Modifier',
                          iconPath: AppIconsData.modifier,
                        ),
                        SPListItem(
                          value: 'detail',
                          label: 'Détail',
                          iconPath: AppIconsData.detail,
                        ),
                        SPListItem(
                          value: 'archiver',
                          label: 'Archiver',
                          iconPath: AppIconsData.archiver,
                        ),
                      ],
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

// ─────────────────────────────────────────────────────────────────────────────
// Demo widgets
// ─────────────────────────────────────────────────────────────────────────────

class _AttendanceBadge extends StatelessWidget {
  const _AttendanceBadge({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.80,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: ShapeDecoration(
          color: const Color(0xFFE5F9FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.person, size: 14, color: Color(0xFF41A3DF)),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFF41A3DF),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimeBadge extends StatelessWidget {
  const _TimeBadge({required this.time});
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: ShapeDecoration(
        color: const Color(0xFFE5F9FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        time,
        style: const TextStyle(
          color: Color(0xFF41A3DF),
          fontSize: 10,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Layout helpers
// ─────────────────────────────────────────────────────────────────────────────

class _Section extends StatelessWidget {
  const _Section({
    required this.label,
    required this.description,
    required this.child,
  });

  final String label;
  final String description;
  final Widget child;

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
        SizedBox(height: theme.spacing.extraSmall),
        SPText.paragraph2(
          description,
          style: TextStyle(color: theme.colors.gray2),
        ),
        SizedBox(height: theme.spacing.small),
        child,
      ],
    );
  }
}
