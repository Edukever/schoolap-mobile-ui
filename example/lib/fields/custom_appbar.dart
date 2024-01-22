import 'dart:math';

import 'package:flutter/material.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SPMainAppbar(
        height: 160,
        showNotificationBadge: Random().nextBool(),
        child: Row(
          children: [
            const CircleAvatar(radius: 30.0),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SPText.title1(
                  'Welcome Callie',
                  color: AppTheme.of(context).colors.blanc,
                  fontWeight: FontWeight.w600,
                  maxLines: 1,
                ),
                SPText.paragraph1(
                  'École Saint Marie',
                  color: AppTheme.of(context).colors.blanc,
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
