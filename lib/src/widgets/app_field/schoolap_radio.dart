part of '../widget.dart';

typedef FormBuilderFieldOptionList<T> = List<FormBuilderFieldOption<T>>;

class SPRadio<T> extends StatelessWidget {
  final String name;
  final String? label;
  final FormBuilderFieldOptionList<T> options;
  const SPRadio(
      {super.key, this.label, required this.name, required this.options});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              label!,
              style: const TextStyle(
                fontSize: 14.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        FormBuilderCheckboxGroup<T>(
          name: name,
          options: options,
        )
      ],
    );
  }
}
