import 'package:flutter/material.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SPMainAppbar(
        height: 160,
        showNotificationBadge: true,
        badgeLabel: '5',
        child: Row(
          children: [
            const CircleAvatar(radius: 30.0),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SPText.title1(
                  'Welcome Callie',
                  style: TextStyle(
                    color: AppTheme.of(context).colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                ),
                SPText.paragraph1(
                  'École Saint Marie',
                  style: TextStyle(color: AppTheme.of(context).colors.white),
                  maxLines: 1,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
