import 'package:example/fields/button_page.dart';
import 'package:example/fields/main_appbar.dart';
import 'package:example/fields/custom_card.dart';
import 'package:example/fields/icon_pages.dart';
import 'package:flutter/material.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

import 'fields/data_table.dart';
import 'fields/page_field_screen.dart';
import 'fields/pagination.dart';
import 'fields/standard_appbar.dart';

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
          title: 'Schoolap mobile package example',
          debugShowCheckedModeBanner: false,
          theme: AppMaterialTheme.defaultTheme(AppTheme.of(context).colors),
          home: const HomePage(),
        );
      }),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Schoolap component"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SPButtonPrimary(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PageFieldScreen())),
              title: ("pages field"),
            ),
            const SizedBox(height: 10),
            SPButtonPrimary(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ButtonPage())),
              title: "Button page",
            ),
            const SizedBox(height: 10),
            SPButtonPrimary(
              title: "Icons page",
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const IconPage())),
            ),
            const SizedBox(height: 10),
            SPButtonPrimary(
              title: "custom card",
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CustomCard())),
            ),
            const SizedBox(height: 10),
            SPButtonPrimary(
              title: "Main AppBar",
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainAppBar())),
            ),
            const SizedBox(height: 10),
            SPButtonPrimary(
              title: "Standard AppBar",
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StandardAppBar())),
            ),
            const SizedBox(height: 10),
            SPButtonPrimary(
              title: "Pagination",
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PaginationPage())),
            ),
            const SizedBox(height: 10),
            SPButtonPrimary(
              title: "Data Table",
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DataTableScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
