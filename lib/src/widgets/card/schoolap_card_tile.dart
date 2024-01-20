import 'package:flutter/material.dart';
import 'package:schoolap_ui/schoolap_ui.dart';
import 'package:schoolap_ui/src/widgets/base/app_card.dart';

class SPCardTile extends StatelessWidget {
  final BoxConstraints constraints;
  final Widget? leading;
  final String title;
  final Widget? trailing;
  final String? subtitle;
  final Widget? subWidget;
  final Color? subtitleColor;
  final EdgeInsetsGeometry? contentPadding;
  const SPCardTile(
      {super.key,
      required this.constraints,
      this.leading,
      required this.title,
      this.trailing,
      this.contentPadding,
      this.subtitle,
      this.subtitleColor,
      this.subWidget});

  @override
  Widget build(BuildContext context) {
    return SPCard(
      constraints: constraints,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: CircleAvatar(
                radius: 30,
                child: leading,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SPText.title2(title),
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
      ),
    );
  }
}
