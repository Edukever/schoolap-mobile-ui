import 'package:flutter/material.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

class IconPage extends StatelessWidget {
  const IconPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const SPText.title2("All icon"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              children: [
                const SPButtonIcon(
                  radius: 0,
                  iconData: AppIconsData.date,
                  shape: ButtonIconShape.square,
                  hasShadow: true,
                ),
                const SizedBox(width: 10),
                const SPButtonIcon(
                  iconData: AppIconsData.date,
                  shape: ButtonIconShape.square,
                  hasShadow: false,
                ),
                const SizedBox(width: 10),
                const SPButtonIcon(iconData: AppIconsData.date, shape: ButtonIconShape.circle),
                const SizedBox(width: 10),
                SPButtonIcon(
                    iconData: AppIconsData.date, shape: ButtonIconShape.outlined, outlinedColor: Colors.orange, iconColor: SPColorsData.defaultColors().orange),
                const SizedBox(width: 10),
                SPButtonIcon(iconData: AppIconsData.date, shape: ButtonIconShape.none, iconColor: SPColorsData.defaultColors().orange),
              ],
            ),
            const SPText.title1("Token"),
            const SizedBox(height: 10),
            const SPChip(
              label: "Chip",
            ),
            const SizedBox(height: 10),
            const SPChip(
              label: "Inactive",
              iconOrTextColor: Color(0xFFFF4F4F),
              appChipType: AppChipType.dot,
            ),
            const SizedBox(height: 10),
            const SPChip(
              backgroundColor: Color(0xFFDDF3D6),
              label: "Inactive",
              iconOrTextColor: Color(0xFF1EA951),
              appChipType: AppChipType.dot,
            ),
            const SizedBox(height: 10),
            const SPChip(
              backgroundColor: Color(0xFFDDF3D6),
              label: "Inactive",
              iconOrTextColor: Color(0xFF1EA951),
              appChipType: AppChipType.icon,
              icon: Icon(Icons.person, size: 15, color: Color(0xFF1EA951)),
            ),
            const SizedBox(height: 10),
            const SPChip(
              width: 200,
              backgroundColor: Color(0xFFDDF3D6),
              label: 'En cours de traitement',
              iconOrTextColor: Color(0xFF1EA951),
            ),
          ],
        ),
      ),
    );
  }
}
