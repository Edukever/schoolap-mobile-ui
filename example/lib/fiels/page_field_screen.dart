import 'package:flutter/material.dart';
import 'package:schoolap_pkg/schoolap_pkg.dart';

class PageFieldScreen extends StatelessWidget {
  const PageFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All text field"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppTextField(
              name: "name",
              placeHolder: 'this is a placeholder',
              label: "This is a label",
            ),
            const AppTextField(
              name: "Password",
              placeHolder: 'this is a placeholder',
              type: AppTextFieldType.password,
              label: "This is a Password",
              obscureText: true,
            ),
            const AppTextField(
              name: "icon",
              placeHolder: 'this is a placeholder',
              label: "This is field with icon",
              prefix: Icon(Icons.person),
            ),
            const AppTextField(
              name: "comment",
              placeHolder: 'this is a comment placeholder',
              maxLines: 5,
              label: "Comment",
            ),
            AppDropDown(
              label: "Rôle de la personne",
              name: "dropdown",
              prefix: const Icon(Icons.person),
              placeHolder: "select one gender",
              onChanged: (e) {},
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text("One"),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text("two"),
                )
              ],
            ),
            const AppTextField(
              name: "date",
              placeHolder: 'this is a placeholder',
              type: AppTextFieldType.date,
              label: "This is field with date",
              prefix: Icon(Icons.date_range),
            ),
          ],
        ),
      ),
    );
  }
}
