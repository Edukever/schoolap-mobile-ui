import 'package:flutter/material.dart';
import 'package:schoolap_pkg/schoolap_pkg.dart';

class IconPage extends StatelessWidget {
  const IconPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const SchoolAppText.title2("All icon"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              children: [
                SchoolAppIconButton(
                  radius: 0,
                  iconData: AppIconsData.date,
                  formState: StateFormIcon.square,
                  hasShadow: true,
                ),
                const SizedBox(width: 10),
                SchoolAppIconButton(
                  iconData: AppIconsData.date,
                  formState: StateFormIcon.square,
                  hasShadow: false,
                ),
                const SizedBox(width: 10),
                SchoolAppIconButton(
                    iconData: AppIconsData.date,
                    formState: StateFormIcon.circle),
                const SizedBox(width: 10),
                SchoolAppIconButton(
                    iconData: AppIconsData.date,
                    formState: StateFormIcon.outlined,
                    outlinedColor: Colors.orange,
                    iconColor: SchoolAppColorsData.defaultColors().orange),
                const SizedBox(width: 10),
                SchoolAppIconButton(
                    iconData: AppIconsData.date,
                    formState: StateFormIcon.none,
                    iconColor: SchoolAppColorsData.defaultColors().orange),
              ],
            ),
            const SchoolAppText.title1("Token"),
            const SizedBox(height: 10),
            const SchoolAppChip(
              label: "Chip",
            ),
            const SizedBox(height: 10),
            const SchoolAppChip(
              label: "Inactive",
              iconOrTextColor: Color(0xFFFF4F4F),
              appChipType: AppChipType.dot,
            ),
            const SizedBox(height: 10),
            const SchoolAppChip(
              backgroundColor: Color(0xFFDDF3D6),
              label: "Inactive",
              iconOrTextColor: Color(0xFF1EA951),
              appChipType: AppChipType.dot,
            ),
            const SizedBox(height: 10),
            const SchoolAppChip(
              backgroundColor: Color(0xFFDDF3D6),
              label: "Inactive",
              iconOrTextColor: Color(0xFF1EA951),
              appChipType: AppChipType.icon,
              icon: Icon(Icons.person, size: 15, color: Color(0xFF1EA951)),
            ),
            const SizedBox(height: 10),
            const SchoolAppChip(
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
