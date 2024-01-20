import 'package:schoolap_ui/schoolap_ui.dart';

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
            const SPTextField(
              name: "name",
              placeHolder: 'this is a placeholder',
              label: "This is a label",
            ),
            const SizedBox(
              height: 10,
            ),
          
            const SPTextField(
              name: "Password",
              placeHolder: 'this is a placeholder',
              type: AppTextFieldType.password,
              label: "This is a Password",
              obscureText: true,
            ),
            const SPTextField(
              name: "icon",
              placeHolder: 'this is a placeholder',
              label: "This is field with icon",
              prefix: Icon(Icons.person),
            ),
            const SPTextField(
              name: "comment",
              placeHolder: 'this is a comment placeholder',
              maxLines: 5,
              label: "Comment",
            ),
            SPDropDown(
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
            const SPTextField(
              name: "date",
              placeHolder: 'this is a placeholder',
              type: AppTextFieldType.date,
              label: "This is field with date",
              prefix: Icon(Icons.date_range),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
