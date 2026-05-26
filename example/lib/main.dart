import 'package:example/fields/appbar_page.dart';
import 'package:example/fields/button_page.dart';
import 'package:example/fields/custom_card.dart';
import 'package:example/fields/data_table.dart';
import 'package:example/fields/icon_pages.dart';
import 'package:example/fields/page_field_screen.dart';
import 'package:example/fields/pagination.dart';
import 'package:example/fields/text_page.dart';
import 'package:flutter/material.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      data: AppThemeData.defaultThemeData(),
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Schoolap UI',
          debugShowCheckedModeBanner: false,
          theme: AppMaterialTheme.defaultTheme(AppTheme.of(context).colors),
          home: const HomePage(),
        );
      }),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Home
// ─────────────────────────────────────────────────────────────────────────────

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Scaffold(
      appBar: SPAppBar(
        'Schoolap UI',
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: theme.spacing.large,
          vertical: theme.spacing.medium,
        ),
        children: [
          _NavGroup(
            label: 'Fondations',
            items: [
              _NavItem(
                icon: Icons.text_fields_rounded,
                title: 'SPText',
                subtitle: 'Typographie — 6 niveaux',
                page: const TextPage(),
              ),
              _NavItem(
                icon: Icons.interests_rounded,
                title: 'Icônes',
                subtitle: 'Bibliothèque d\'icônes SVG',
                page: const IconPage(),
              ),
            ],
          ),
          SizedBox(height: theme.spacing.medium),
          _NavGroup(
            label: 'Composants',
            items: [
              _NavItem(
                icon: Icons.smart_button_rounded,
                title: 'SPButton',
                subtitle: 'Filled, outlined, presets, icon',
                page: const ButtonPage(),
              ),
              _NavItem(
                icon: Icons.web_asset_rounded,
                title: 'SPAppBar',
                subtitle: 'Standard, landscape, main',
                page: const AppBarPage(),
              ),
              _NavItem(
                icon: Icons.dashboard_rounded,
                title: 'Cartes',
                subtitle: 'SPCardTile, SPCardAlert…',
                page: const CardPage(),
              ),
            ],
          ),
          SizedBox(height: theme.spacing.medium),
          _NavGroup(
            label: 'Formulaires',
            items: [
              _NavItem(
                icon: Icons.input_rounded,
                title: 'Champs & Dropdowns',
                subtitle: 'SPTextField, SPDropDown…',
                page: const PageFieldScreen(),
              ),
            ],
          ),
          SizedBox(height: theme.spacing.medium),
          _NavGroup(
            label: 'Données',
            items: [
              _NavItem(
                icon: Icons.table_chart_rounded,
                title: 'SPDataTable',
                subtitle: 'Tri, sélection, style, pagination',
                page: const DataTableScreen(),
              ),
              _NavItem(
                icon: Icons.more_horiz_rounded,
                title: 'SPPagination',
                subtitle: 'Navigation entre pages',
                page: const PaginationPage(),
              ),
            ],
          ),
          SizedBox(height: theme.spacing.extraLarge),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Nav group
// ─────────────────────────────────────────────────────────────────────────────

class _NavGroup extends StatelessWidget {
  const _NavGroup({required this.label, required this.items});

  final String label;
  final List<_NavItem> items;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: theme.spacing.small),
          child: SPText.label(
            label.toUpperCase(),
            style: TextStyle(color: theme.colors.gray2, letterSpacing: 1.2),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: theme.radius.asBorderRadius().medium,
            border: Border.all(color: theme.colors.gray2.withAlpha(40)),
          ),
          child: Column(
            children: [
              for (int i = 0; i < items.length; i++) ...[
                if (i > 0)
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: theme.colors.gray2.withAlpha(30),
                    indent: 56,
                  ),
                items[i],
              ],
            ],
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Nav item
// ─────────────────────────────────────────────────────────────────────────────

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.page,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return InkWell(
      borderRadius: theme.radius.asBorderRadius().medium,
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => page),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: theme.spacing.medium,
          vertical: theme.spacing.small,
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: theme.colors.blueLight,
                borderRadius: theme.radius.asBorderRadius().small,
              ),
              child: Icon(icon, size: 18, color: theme.colors.blue),
            ),
            SizedBox(width: theme.spacing.medium),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SPText.paragraph1(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SPText.paragraph2(
                    subtitle,
                    style: TextStyle(color: theme.colors.gray2),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              size: 20,
              color: theme.colors.gray2,
            ),
          ],
        ),
      ),
    );
  }
}
