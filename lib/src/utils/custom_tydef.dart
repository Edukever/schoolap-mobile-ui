import 'package:schoolap_pkg/schoolap_pkg.dart';

typedef Validator<T> = String? Function(T?);

typedef Builder<T> = Widget Function(
    BuildContext context, T? value, Widget? child);

typedef ItemBuilder<T> = Widget Function(
    BuildContext context, T item, bool isSelected);

typedef DropdownMenuItemBuilder<T> = Widget Function(
    BuildContext context, T item);

typedef DropdownButtonBuilder<T> = Widget Function(
    BuildContext context, T? value, Widget? child);