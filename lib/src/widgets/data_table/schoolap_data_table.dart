part of '../widget.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Style
// ─────────────────────────────────────────────────────────────────────────────

/// Visual configuration for [SPDataTable].
class SPDataTableStyle {
  const SPDataTableStyle({
    // ── Heading row ───────────────────────────────────────────────────────────
    this.headingRowColor,
    this.headingTextStyle,
    this.headingRowHeight = 35.0,
    // ── Data rows ─────────────────────────────────────────────────────────────
    this.dataRowColor,
    this.dataRowMinHeight = 10.0,
    this.dataRowMaxHeight = 36.0,
    this.showBottomBorder = false,
    // ── Layout ────────────────────────────────────────────────────────────────
    this.horizontalPadding = EdgeInsets.zero,
    this.textAlign = TextAlign.left,
  });

  // ── Heading row ─────────────────────────────────────────────────────────────

  /// Heading row background. Defaults to [AppColorsData.blueLight].
  final WidgetStateProperty<Color?>? headingRowColor;

  /// Heading text style. Auto-derived from [headingRowColor] when null.
  final TextStyle? headingTextStyle;

  final double headingRowHeight;

  // ── Data rows ───────────────────────────────────────────────────────────────

  /// Row background. Defaults to a light grey (`#F1F0F0`).
  final WidgetStateProperty<Color?>? dataRowColor;

  final double dataRowMinHeight;
  final double dataRowMaxHeight;
  final bool showBottomBorder;

  // ── Layout ──────────────────────────────────────────────────────────────────

  /// Padding applied around the horizontally-scrollable table area.
  final EdgeInsets horizontalPadding;

  /// Default text alignment for all cells.
  /// Overridden per-column via [SPDataTableColumn.textAlign].
  final TextAlign textAlign;
}

// ─────────────────────────────────────────────────────────────────────────────
// Selection
// ─────────────────────────────────────────────────────────────────────────────

/// Selection configuration for [SPDataTable].
class SPDataTableSelection<T> {
  const SPDataTableSelection({
    this.selectedRows = const [],
    this.selectedRowColor,
    this.onSelectChanged,
    this.onSelectAll,
  });

  final List<T> selectedRows;

  /// Highlight colour for selected rows.
  /// Defaults to [AppColorsData.blue] at 30 % opacity.
  final Color? selectedRowColor;

  final void Function(bool? selected, T item)? onSelectChanged;
  final void Function(bool? selected)? onSelectAll;
}

// ─────────────────────────────────────────────────────────────────────────────
// SPDataTable
// ─────────────────────────────────────────────────────────────────────────────

class SPDataTable<T> extends StatefulWidget {
  const SPDataTable({
    super.key,
    // ── Data ──────────────────────────────────────────────────────────────────
    required this.columns,
    required this.rows,
    required this.emptyBuilder,
    // ── Appearance ────────────────────────────────────────────────────────────
    this.style = const SPDataTableStyle(),
    this.headerIconColor,
    // ── Selection ─────────────────────────────────────────────────────────────
    this.showCheckboxColumn = false,
    this.selection,
    // ── Interaction ───────────────────────────────────────────────────────────
    this.onRowTap,
  });

  // ── Data ────────────────────────────────────────────────────────────────────

  final List<SPDataTableColumn<T>> columns;
  final List<T> rows;

  /// Widget shown when [rows] is empty.
  final WidgetBuilder emptyBuilder;

  // ── Appearance ──────────────────────────────────────────────────────────────

  final SPDataTableStyle style;

  /// Overrides the icon colour in the heading row (sort arrows, checkboxes).
  final Color? headerIconColor;

  // ── Selection ───────────────────────────────────────────────────────────────

  final bool showCheckboxColumn;
  final SPDataTableSelection<T>? selection;

  // ── Interaction ─────────────────────────────────────────────────────────────

  /// Called when a row is tapped (unless the cell has its own [onTap]).
  final void Function(T row)? onRowTap;

  @override
  State<SPDataTable<T>> createState() => _SPDataTableState<T>();
}

class _SPDataTableState<T> extends State<SPDataTable<T>> {
  int? _sortColumn;
  bool _ascending = true;

  // ─────────────────────────────────────────────────────────────────────────────

  List<T> get _sorted {
    final rows = [...widget.rows];
    if (_sortColumn != null) {
      rows.sort(
        (a, b) => widget.columns[_sortColumn!]._compare(a, b, _ascending),
      );
    }
    return rows;
  }

  Color _textOnBg(Color bg) => ThemeData.estimateBrightnessForColor(bg) == Brightness.light ? Colors.black : Colors.white;

  // ── Cell builders ────────────────────────────────────────────────────────────

  Widget _cellContent(T row, int index, SPDataTableColumn<T> col) {
    final align = col.textAlign ?? widget.style.textAlign;

    if (col.cellBuilder != null) {
      final result = col.cellBuilder!(row, index);
      // Sync widget — use directly.
      if (result is Widget?) return result ?? const SizedBox.shrink();
      // Async widget.
      return FutureBuilder<Widget?>(
        future: result,
        builder: (_, snap) => snap.data ?? const SizedBox.shrink(),
      );
    }

    final textResult = col.cellText(row, index);
    // Sync string — use directly.
    if (textResult is String?) return _textCell(textResult ?? '', align);
    // Async string.
    return FutureBuilder<String?>(
      future: textResult,
      builder: (_, snap) => _textCell(snap.data ?? '', align),
    );
  }

  Widget _textCell(String text, TextAlign align) => Text(
        text,
        textAlign: align,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 12, fontFamily: 'Poppins'),
      );

  // ── Build ────────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final style = widget.style;
    final sel = widget.selection;
    final rows = _sorted;

    // Heading appearance
    final headingBg = style.headingRowColor ?? WidgetStatePropertyAll(theme.colors.blueLight);
    final headingFg = _textOnBg(
      headingBg.resolve({WidgetState.pressed}) ?? theme.colors.blueLight,
    );
    final headingTextStyle = style.headingTextStyle ??
        TextStyle(
          color: headingFg,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
        );

    final table = Theme(
      data: Theme.of(context).copyWith(
        iconTheme: Theme.of(context).iconTheme.copyWith(color: widget.headerIconColor ?? headingFg),
      ),
      child: DataTable(
        onSelectAll: sel?.onSelectAll,
        showCheckboxColumn: widget.showCheckboxColumn,
        headingRowColor: headingBg,
        headingTextStyle: headingTextStyle,
        headingRowHeight: style.headingRowHeight,
        dataRowColor: style.dataRowColor ?? const WidgetStatePropertyAll(Color.fromRGBO(241, 240, 240, 1)),
        dataRowMinHeight: style.dataRowMinHeight,
        dataRowMaxHeight: style.dataRowMaxHeight,
        showBottomBorder: style.showBottomBorder,
        sortColumnIndex: _sortColumn,
        sortAscending: _ascending,
        // ── Columns ───────────────────────────────────────────────────────────
        columns: widget.columns.map((col) {
          return DataColumn(
            tooltip: col.tooltip,
            mouseCursor: col.mouseCursor,
            label: col.headerBuilder ??
                Expanded(
                  child: Text(
                    col.headerText,
                    textAlign: col.textAlign ?? style.textAlign,
                    style: headingTextStyle,
                  ),
                ),
            onSort: col.sortable
                ? (i, asc) => setState(() {
                      _sortColumn = i;
                      _ascending = asc;
                    })
                : null,
          );
        }).toList(),
        // ── Rows ──────────────────────────────────────────────────────────────
        rows: rows.asMap().entries.map((entry) {
          final index = entry.key;
          final row = entry.value;
          final isSelected = sel?.selectedRows.contains(row) ?? false;
          final rowColor = isSelected ? (sel?.selectedRowColor ?? theme.colors.blue.withAlpha((255 * 0.3).toInt())) : null;

          return DataRow(
            selected: widget.showCheckboxColumn && isSelected,
            color: WidgetStatePropertyAll(rowColor),
            onSelectChanged: widget.showCheckboxColumn ? (v) => sel?.onSelectChanged?.call(v, row) : null,
            cells: widget.columns.map<DataCell>((col) {
              return DataCell(
                SizedBox(
                  width: col.width,
                  child: _cellContent(row, index, col),
                ),
                onTap: col.onTap != null
                    ? () => col.onTap!(row, index)
                    : widget.onRowTap != null
                        ? () => widget.onRowTap!(row)
                        : null,
                onDoubleTap: col.onDoubleTap != null ? () => col.onDoubleTap!(row, index) : null,
                onLongPress: col.onLongPress != null ? () => col.onLongPress!(row, index) : null,
              );
            }).toList(),
          );
        }).toList(),
      ),
    );

    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (rows.isNotEmpty)
              SingleChildScrollView(
                padding: style.horizontalPadding,
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: constraints.maxWidth),
                  child: table,
                ),
            ),
          if (rows.isEmpty) widget.emptyBuilder(context),
        ],
      ),
    );
    });
  }
}
