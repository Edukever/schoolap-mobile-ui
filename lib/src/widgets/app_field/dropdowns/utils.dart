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

  List<DropdownMenuItem<R>> generate({required String Function(T item) getName, required R Function(T item) getValue}) {
    final List<DropdownMenuItem<R>> menuItems = [];
    for (final T item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<R>(
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
            const DropdownMenuItem(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return menuItems;
  }

  List<double> get calculateItemHeights {
    final List<double> itemsHeights = [];
    for (int i = 0; i < (items.length * 2) - 1; i++) {
      if (i.isEven) {
        itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        itemsHeights.add(4);
      }
    }
    return itemsHeights;
  }

  static DropdownStyleData dropdownStyleData({double? maxHeightDropDown, Color? color}) => DropdownStyleData(
        maxHeight: maxHeightDropDown ?? 150,
        elevation: 0,
        decoration: BoxDecoration(
          color: color ?? Colors.transparent,
          border: Border.all(color: Colors.black),
          borderRadius: const BorderRadius.all(Radius.circular(14)),
        ),
        scrollbarTheme: ScrollbarThemeData(
          //   radius: const Radius.circular(40),
          thickness: MaterialStateProperty.all(6),
          thumbVisibility: MaterialStateProperty.all(true),
        ),
      );
}
