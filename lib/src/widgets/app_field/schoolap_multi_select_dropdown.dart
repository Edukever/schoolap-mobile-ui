part of '../widget.dart';

/// A multi-select dropdown form field that shows selected items as chips
/// and opens a searchable inline dropdown list.
///
/// Must be placed inside a [FormBuilder]. The field stores `List<T>`
/// in the form under [name].
///
/// [md.DropdownItem] and [md.MultiSelectController] come from the
/// `multi_dropdown` package. Add it as a direct dependency in your
/// `pubspec.yaml` to create items and controllers.
///
/// ### Basic usage
/// ```dart
/// final controller = MultiSelectController<String>();
///
/// SPMultiSelectDropdown<String>(
///   name: 'tags',
///   placeholder: 'Select tags',
///   multiSelectController: controller,
///   options: const [
///     DropdownItem(label: 'Flutter', value: 'flutter'),
///     DropdownItem(label: 'Dart', value: 'dart'),
///   ],
/// )
/// ```
class SPMultiSelectDropdown<T extends Object> extends StatefulWidget {
  /// The key used to identify this field inside a [FormBuilder].
  final String name;

  /// The full list of selectable options.
  final List<md.DropdownItem<T>> options;

  /// Hint text shown when no items are selected, also used as the
  /// search field placeholder inside the picker.
  final String placeholder;

  /// Optional leading icon shown on each selected chip.
  /// Defaults to [Icons.person_outline] when omitted.
  final Widget? icon;

  /// Optional validator called with the current `List<T>` selection.
  final String? Function(List<T>?)? validator;

  /// Controller that drives and exposes the selected items.
  final md.MultiSelectController<T> multiSelectController;

  /// Values that should be pre-selected when the field first renders.
  final List<T>? initialValue;

  /// Maximum height of the scrollable item list inside the dropdown.
  final double dropdownHeight;

  /// Called whenever the selection changes.
  final void Function(List<T>?)? onChanged;

  const SPMultiSelectDropdown({
    super.key,
    required this.name,
    required this.options,
    required this.placeholder,
    required this.multiSelectController,
    this.icon,
    this.validator,
    this.initialValue,
    this.dropdownHeight = 200,
    this.onChanged,
  });

  @override
  State<SPMultiSelectDropdown<T>> createState() => _SPMultiSelectDropdownState<T>();
}

class _SPMultiSelectDropdownState<T extends Object> extends State<SPMultiSelectDropdown<T>> {
  @override
  void initState() {
    super.initState();
    _applyInitialSelection();
  }

  @override
  void didUpdateWidget(SPMultiSelectDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.options != widget.options || oldWidget.initialValue != widget.initialValue) {
      _applyInitialSelection();
    }
  }

  void _applyInitialSelection() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final initial = widget.initialValue;
      if (widget.multiSelectController.selectedItems.isEmpty && initial != null) {
        final toSelect = widget.options.where((e) => initial.contains(e.value)).toList();
        if (toSelect.isNotEmpty) {
          widget.multiSelectController.selectWhere((e) => toSelect.contains(e));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;

    return FormBuilderField<List<T>>(
      name: widget.name,
      validator: widget.validator,
      initialValue: widget.initialValue,
      onChanged: widget.onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (field) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            md.MultiDropdown<T>(
              items: widget.options,
              controller: widget.multiSelectController,
              searchEnabled: true,
              searchDecoration: md.SearchFieldDecoration(hintText: widget.placeholder),
              dropdownDecoration: md.DropdownDecoration(maxHeight: widget.dropdownHeight),
              fieldDecoration: md.FieldDecoration(
                hintText: widget.placeholder,
                hintStyle: const TextStyle(fontSize: 12.0, fontFamily: 'Poppins'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: field.hasError ? colors.rouge : colors.grid2.withValues(alpha: 0.35),
                    width: 1.0,
                  ),
                ),
              ),
              onSelectionChange: (selectedValues) {
                if (context.mounted) {
                  field.didChange(selectedValues);
                  widget.onChanged?.call(selectedValues);
                }
              },
              selectedItemBuilder: (item) => _SelectedItem<T>(
                valueItem: item,
                icon: widget.icon,
                multiSelectController: widget.multiSelectController,
              ),
              itemBuilder: (item, index, onTap) => _DropdownOption<T>(
                item: item,
                onTap: onTap,
              ),
            ),
            if (field.hasError) _MultiSelectErrorMessage(fieldError: field.errorText),
          ],
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Sub-widgets
// ---------------------------------------------------------------------------

class _SelectedItem<T extends Object> extends StatelessWidget {
  final md.DropdownItem<T> valueItem;
  final Widget? icon;
  final md.MultiSelectController<T> multiSelectController;

  const _SelectedItem({
    super.key,
    required this.valueItem,
    required this.multiSelectController,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    return Container(
      decoration: BoxDecoration(
        color: colors.gridLight,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: colors.grid2.withValues(alpha: 0.15)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon ?? Icon(Icons.person_outline, size: 16, color: colors.grid2),
          const SizedBox(width: 4),
          Flexible(child: SPText(valueItem.label, overflow: TextOverflow.ellipsis)),
          const SizedBox(width: 4),
          InkWell(
            onTap: () => multiSelectController.unselectWhere((e) => e.value == valueItem.value),
            customBorder: const CircleBorder(),
            child: Container(
              decoration: BoxDecoration(color: colors.grid2, shape: BoxShape.circle),
              alignment: Alignment.center,
              width: 18.0,
              height: 18.0,
              child: const Icon(Icons.close, size: 14.0, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _DropdownOption<T extends Object> extends StatelessWidget {
  final md.DropdownItem<T> item;
  final VoidCallback onTap;

  const _DropdownOption({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: item.selected ? colors.grid2 : null,
                border: item.selected ? null : Border.all(color: colors.grid2.withValues(alpha: 0.35), width: 1.0),
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
              child: item.selected ? const Icon(Icons.check, size: 15, color: Colors.white) : null,
            ),
            const SizedBox(width: 6),
            Expanded(child: SPText(item.label)),
          ],
        ),
      ),
    );
  }
}

class _MultiSelectErrorMessage extends StatelessWidget {
  final String? fieldError;

  const _MultiSelectErrorMessage({required this.fieldError});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: SPText.paragraph1(fieldError ?? '', color: AppTheme.of(context).colors.rouge, fontSize: 12),
    );
  }
}
