import 'package:flutter/material.dart';
import 'package:schoolap_pkg/schoolap_pkg.dart';

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
      body: Center(
        child: Text(
          "Hello World",
          style: TextStyle(
            color: AppTheme.of(context).colors.blue2,
          ),
        ),
      ),
    );
  }
}
