part of '../../widget.dart';

class DropdownMenuItemGenerator<T, R> {
  final List<T> items;
  final double itemHeight;
  final double dividerHeight;

  DropdownMenuItemGenerator({
    required this.items,
    this.itemHeight = 40.0,
    this.dividerHeight = 4.0,
  });

  List<DropdownItem<R>> generate(
      {required String Function(T item) getName,
      required R Function(T item) getValue}) {
    final List<DropdownItem<R>> menuItems = [];
    for (final T item in items) {
      menuItems.addAll(
        [
          DropdownItem<R>(
            height: itemHeight,
            value: getValue(item),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SPText(
                getName(item),
                fontSize: 14,
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            DropdownItem(
              height: dividerHeight,
              enabled: false,
              child: const Divider(),
            ),
        ],
      );
    }
    return menuItems;
  }

  static DropdownStyleData dropdownStyleData(
          {double? maxHeightDropDown, Color? color}) =>
      DropdownStyleData(
        maxHeight: maxHeightDropDown ?? 150,
        elevation: 0,
        decoration: BoxDecoration(
          color: color ?? Colors.transparent,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.all(const AppRadiusData.primary().large),
        ),
        scrollbarTheme: ScrollbarThemeData(
          //   radius: const Radius.circular(40),
          thickness: WidgetStateProperty.all(6),
          thumbVisibility: WidgetStateProperty.all(true),
        ),
      );
}
