import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

class PageFieldScreen extends StatelessWidget {
  const PageFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All text field"),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SPTextField(
              name: "name",
              placeHolder: 'this is a placeholder',
              label: "This is a label",
            ),
            SizedBox(
              height: 10,
            ),
            SPTextField(
              name: "Password",
              placeHolder: 'this is a placeholder',
              type: AppTextFieldType.password,
              label: "This is a Password",
              obscureText: true,
            ),
            SPTextField(
              name: "icon",
              placeHolder: 'this is a placeholder',
              label: "This is field with icon",
              prefix: Icon(Icons.person),
            ),
            SPTextField(
              name: "comment",
              placeHolder: 'this is a comment placeholder',
              maxLines: 5,
              label: "Comment",
            ),
            SPTextField(
              name: "date",
              placeHolder: 'this is a placeholder',
              label: "This is field with date",
              prefix: Icon(Icons.date_range),
            ),
            SizedBox(height: 20),
            SPCheckBoxGroup(name: "checkBox", label: "checkbox", options: [
              FormBuilderFieldOption(value: 1, child: Text("One")),
              FormBuilderFieldOption(value: 2, child: Text("Two")),
            ]),
            SizedBox(height: 20),
            SPCheckBoxGroup(
              name: 'ss',
              options: [],
            ),
            SizedBox(height: 20),
            SPRadio(
              name: "radio",
              label: "Radio",
              options: [
                FormBuilderFieldOption(value: 1, child: Text("One")),
                FormBuilderFieldOption(value: 2, child: Text("Two")),
              ],
            ),
            SizedBox(height: 40),
            SPCheckBox(
              name: 'rem',
              title: Text('Remember me'),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
