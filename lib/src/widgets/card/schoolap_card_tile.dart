part of '../widget.dart';

class SPCardTile extends StatelessWidget {
  final BoxConstraints constraints;
  final Widget? leading;
  final String title;
  final Widget? titleWidget;
  final Widget? trailing;
  final String? subtitle;
  final Widget? subWidget;
  final Color? subtitleColor;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? floatContentRight;
  final VoidCallback? onTap;
  const SPCardTile({
    super.key,
    required this.constraints,
    this.leading,
    required this.title,
    this.trailing,
    this.contentPadding,
    this.subtitle,
    this.subtitleColor,
    this.subWidget,
    this.floatContentRight,
    this.onTap,
    this.titleWidget,
  });

  @override
  Widget build(BuildContext context) {
    return SPCard(
      onTap: onTap,
      constraints: constraints,
      backgroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leading ??
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      radius: 30,
                    ),
                  ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleWidget ?? SPText.title1(title),
                    subtitle == null
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: SPText.paragraph1(
                              subtitle!,
                              color: subtitleColor,
                            ),
                          ),
                    subWidget ?? Container()
                  ],
                ),
              ),
              trailing ?? Container(),
            ],
          ),
          floatContentRight ?? Container(),
        ],
      ),
    );
  }
}
