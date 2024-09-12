import 'dart:async';

import 'package:flutter/material.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

part 'schoolap_data_table_column.dart';

class SPDataTable<T> extends StatefulWidget {
  final List<SPDataTableColumn<T>> columns;
  final List<T> rows;
  final TextAlign textAlign;
  final Color? headerIconColor;
  final bool showCheckboxColumn;
  final WidgetStateProperty<Color?>? headingRowColor;
  final TextStyle? headingTextStyle;
  final EdgeInsets horizontalPadding;
  final WidgetStateProperty<Color?>? dataRowColor;
  final void Function(bool?, T item)? onSelectChanged;
  final List<T> selectedRows;
  final Color? selectedRowColor;
  final Widget Function(BuildContext context) emptyItemBuilder;
  final bool showBottomBorder;
  final double? headingRowHeight;
  final double dataRowMinHeight;
  final double dataRowMaxHeight;
  final void Function(bool?)? onSelectAll;

  const SPDataTable({
    super.key,
    required this.columns,
    required this.rows,
    required this.emptyItemBuilder,
    this.textAlign = TextAlign.left,
    this.headerIconColor,
    this.showCheckboxColumn = false,
    this.headingRowColor,
    this.headingTextStyle,
    this.horizontalPadding = EdgeInsets.zero,
    this.dataRowColor,
    this.onSelectChanged,
    this.selectedRows = const [],
    this.selectedRowColor,
    this.showBottomBorder = false,
    this.headingRowHeight = 35.0,
    this.dataRowMinHeight = 10.0,
    this.dataRowMaxHeight = 36.0,
    this.onSelectAll,
  });

  @override
  State<SPDataTable<T>> createState() => _SPDataTableState<T>();
}

class _SPDataTableState<T> extends State<SPDataTable<T>> {
  int? _currentSortColumn;
  bool _isAscending = true;

  Color blackOrWhite(Color background) {
    return ThemeData.estimateBrightnessForColor(background) == Brightness.light ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final List<T> rows = [...widget.rows];

    if (_currentSortColumn != null) {
      rows.sort((a, b) {
        return widget.columns[_currentSortColumn!].sort?.call(a, b, _isAscending) ?? 0;
      });
    }

    final headingTextStyle = widget.headingTextStyle ??
        TextStyle(
          color: blackOrWhite(
            widget.headingRowColor?.resolve({WidgetState.pressed}) ?? AppTheme.of(context).colors.bleuLight,
          ),
        );

    final dataTable = Theme(
      data: Theme.of(context).copyWith(
        iconTheme: Theme.of(context).iconTheme.copyWith(color: widget.headerIconColor ?? headingTextStyle.color),
      ),
      child: DataTable(
        onSelectAll: widget.onSelectAll,
        dataRowMinHeight: widget.dataRowMinHeight,
        dataRowMaxHeight: widget.dataRowMaxHeight,
        headingRowHeight: widget.headingRowHeight,
        showBottomBorder: widget.showBottomBorder,
        showCheckboxColumn: widget.showCheckboxColumn,
        headingRowColor: widget.headingRowColor ?? WidgetStatePropertyAll(AppTheme.of(context).colors.bleuLight),
        headingTextStyle: headingTextStyle,
        dataRowColor: widget.dataRowColor ?? const WidgetStatePropertyAll(Color.fromRGBO(241, 240, 240, 1)),
        sortColumnIndex: _currentSortColumn,
        sortAscending: _isAscending,
        columns: widget.columns
            .map(
              (column) => DataColumn(
                mouseCursor: column.mouseCursor,
                tooltip: column.tooltip,
                label: column.headerBuilder ??
                    Expanded(
                      child: SizedBox(
                        child: Text(
                          column.headerText,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, fontFamily: "Poppins"),
                          textAlign: column.textAlign ?? widget.textAlign,
                        ),
                      ),
                    ),
                onSort: column.sortable
                    ? (columnIndex, ascending) {
                        setState(() {
                          _currentSortColumn = columnIndex;
                          _isAscending = ascending;
                        });
                      }
                    : null,
              ),
            )
            .toList(),
        rows: rows.asMap().entries.map((entry) {
          final index = entry.key;
          final row = entry.value;
          final rowColor = widget.selectedRows.contains(row) ? (widget.selectedRowColor ?? AppTheme.of(context).colors.bleu.withOpacity(0.3)) : null;

          return DataRow(
            selected: widget.showCheckboxColumn ? widget.selectedRows.contains(row) : false,
            color: WidgetStatePropertyAll(rowColor),
            onSelectChanged: widget.showCheckboxColumn ? (value) => widget.onSelectChanged?.call(value, row) : null,
            cells: widget.columns.map<DataCell>((column) {
              final textCell = column.cellText(row, index);
              return DataCell(
                SizedBox(
                  width: column.width,
                  child: FutureBuilder<String?>(
                    future: Future.value(textCell),
                    initialData: textCell is! Future ? textCell : null,
                    builder: (context, snapshot) {
                      if (column.cellWidgetBuilder != null) {
                        final future = column.cellWidgetBuilder?.call(row, index);
                        if (future is! Future) return future ?? const SizedBox();
                        return FutureBuilder<Widget?>(
                          future: Future.value(future),
                          initialData: const SizedBox(),
                          builder: (context, snapshot) => snapshot.data ?? const SizedBox(),
                        );
                      }
                      if ((column.textAlign ?? widget.textAlign) != TextAlign.center) {
                        return SizedBox(
                          child: Text(
                            snapshot.data ?? '',
                            textAlign: column.textAlign ?? widget.textAlign,
                            style: const TextStyle(fontSize: 12, fontFamily: "Poppins"),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }
                      return SizedBox(
                        child: Text(
                          snapshot.data ?? '',
                          textAlign: column.textAlign ?? widget.textAlign,
                          style: const TextStyle(fontSize: 12, fontFamily: "Poppins"),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    },
                  ),
                ),
                onLongPress: column.onLongPress == null ? null : () => column.onLongPress?.call(row, index),
                onTap: column.onTap == null ? null : () => column.onTap?.call(row, index),
                onDoubleTap: column.onDoubleTap == null ? null : () => column.onDoubleTap?.call(row, index),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );

    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (rows.isNotEmpty)
              SingleChildScrollView(
                padding: widget.horizontalPadding,
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: constraints.biggest.width),
                  child: dataTable,
                ),
              ),
            if (rows.isEmpty) widget.emptyItemBuilder.call(context),
          ],
        ),
      );
    });
  }
}
