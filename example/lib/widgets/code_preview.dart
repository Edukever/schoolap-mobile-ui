import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

class CodePreview extends StatefulWidget {
  const CodePreview({
    super.key,
    required this.child,
    required this.code,
  });

  final Widget child;

  /// Dart source snippet shown when the user toggles the code block.
  final String code;

  @override
  State<CodePreview> createState() => _CodePreviewState();
}

class _CodePreviewState extends State<CodePreview> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Component preview ───────────────────────────────────────
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(theme.spacing.medium),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: theme.colors.gray2.withAlpha(50)),
            borderRadius: theme.radius.asBorderRadius().medium.copyWith(
                  bottomLeft: _expanded ? Radius.zero : null,
                  bottomRight: _expanded ? Radius.zero : null,
                ),
          ),
          child: widget.child,
        ),

        // ── Toolbar ─────────────────────────────────────────────────
        Container(
          decoration: BoxDecoration(
            color: _expanded
                ? const Color(0xFF282C34)
                : theme.colors.gray2.withAlpha(20),
            border: Border(
              left: BorderSide(color: theme.colors.gray2.withAlpha(50)),
              right: BorderSide(color: theme.colors.gray2.withAlpha(50)),
              bottom: _expanded
                  ? const BorderSide(color: Color(0xFF3E4451))
                  : BorderSide(color: theme.colors.gray2.withAlpha(50)),
              top: _expanded
                  ? const BorderSide(color: Color(0xFF3E4451))
                  : BorderSide.none,
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 12),
              Icon(
                Icons.code_rounded,
                size: 14,
                color: _expanded
                    ? Colors.white54
                    : theme.colors.gray2,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: SPText.paragraph2(
                  'Dart',
                  style: TextStyle(
                    color: _expanded ? Colors.white54 : theme.colors.gray2,
                  ),
                ),
              ),
              // Copy button
              if (_expanded)
                _ToolbarButton(
                  icon: Icons.copy_all_rounded,
                  label: 'Copier',
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(text: widget.code.trim()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Code copié dans le presse-papier'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                ),
              // Toggle button
              _ToolbarButton(
                icon: _expanded
                    ? Icons.keyboard_arrow_up_rounded
                    : Icons.keyboard_arrow_down_rounded,
                label: _expanded ? 'Masquer' : 'Voir le code',
                color: _expanded ? Colors.white70 : theme.colors.gray2,
                onPressed: () => setState(() => _expanded = !_expanded),
              ),
            ],
          ),
        ),

        // ── Code block ───────────────────────────────────────────────
        if (_expanded)
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: theme.radius.medium,
              bottomRight: theme.radius.medium,
            ),
            child: HighlightView(
              widget.code.trim(),
              language: 'dart',
              theme: atomOneDarkTheme,
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
              textStyle: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 12.5,
                height: 1.6,
              ),
            ),
          ),
      ],
    );
  }
}

class _ToolbarButton extends StatelessWidget {
  const _ToolbarButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.color,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final effectiveColor = color ?? theme.colors.gray2;

    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SPText.paragraph2(label, style: TextStyle(color: effectiveColor)),
            const SizedBox(width: 4),
            Icon(icon, size: 14, color: effectiveColor),
          ],
        ),
      ),
    );
  }
}
