part of '../widget.dart';

class SPCardTile extends StatelessWidget {
  const SPCardTile({
    super.key,
    required this.title,
    this.titleWidget,
    this.leading,
    this.trailing,
    this.subtitle,
    this.subtitleColor,
    this.bottom,
    this.overlay,
    this.contentPadding,
    this.constraints = const BoxConstraints(maxWidth: double.infinity),
    this.onTap,
  });

  final String title;

  /// Replaces the title text with a fully custom widget.
  final Widget? titleWidget;

  /// Widget placed at the start of the row. Defaults to a [CircleAvatar].
  final Widget? leading;

  /// Widget placed at the end of the row.
  final Widget? trailing;

  final String? subtitle;
  final Color? subtitleColor;

  /// Widget rendered below the title/subtitle inside the content column.
  final Widget? bottom;

  /// Widget overlaid on top of the card via a [Stack].
  /// Wrap in [Positioned] for precise placement.
  final Widget? overlay;

  final EdgeInsetsGeometry? contentPadding;
  final BoxConstraints constraints;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SPCard(
      onTap: onTap,
      constraints: constraints,
      backgroundColor: Colors.white,
      padding: contentPadding ??
          const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (leading != null)
                leading!
              else
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: CircleAvatar(radius: 30),
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleWidget ?? SPText.title1(title),
                    if (subtitle != null)
                      SPText.paragraph1(
                        subtitle!,
                        style: TextStyle(color: subtitleColor),
                      ),
                    if (bottom != null) bottom!,
                  ],
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
          if (overlay != null) overlay!,
        ],
      ),
    );
  }
}
