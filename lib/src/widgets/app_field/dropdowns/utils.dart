part of '../../widget.dart';

class DropdownMenuItemGenerator<T, R> {
  DropdownMenuItemGenerator({
    required this.items,
    this.itemHeight = 40.0,
    this.dividerHeight = 4.0,
  });

  final List<T> items;
  final double itemHeight;
  final double dividerHeight;

  List<DropdownItem<R>> generate({
    required String Function(T item) getName,
    required R Function(T item) getValue,
  }) {
    final menuItems = <DropdownItem<R>>[];
    for (final item in items) {
      menuItems.addAll([
        DropdownItem<R>(
          height: itemHeight,
          value: getValue(item),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SPText(getName(item), style: const TextStyle(fontSize: 14)),
          ),
        ),
        if (item != items.last)
          DropdownItem(
            height: dividerHeight,
            enabled: false,
            child: const Divider(),
          ),
      ]);
    }
    return menuItems;
  }

  static DropdownStyleData dropdownStyleData({
    double? maxHeightDropDown,
    Color? color,
  }) =>
      DropdownStyleData(
        maxHeight: maxHeightDropDown ?? 150,
        elevation: 0,
        decoration: BoxDecoration(
          color: color ?? Colors.transparent,
          border: Border.all(color: Colors.black),
          borderRadius:
              BorderRadius.all(const AppRadiusData.primary().large),
        ),
        scrollbarTheme: ScrollbarThemeData(
          thickness: WidgetStateProperty.all(6),
          thumbVisibility: WidgetStateProperty.all(true),
        ),
      );
}
