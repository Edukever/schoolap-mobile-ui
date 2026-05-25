part of '../widget.dart';

/// A column definition for [SPDataTable].
///
/// Provide either [cellBuilder] (widget) or [cellText] (string). When both
/// are given, [cellBuilder] takes precedence.
class SPDataTableColumn<T> {
  const SPDataTableColumn({
    // ── Header ────────────────────────────────────────────────────────────────
    required this.headerText,
    this.headerBuilder,
    this.tooltip,
    this.mouseCursor,
    // ── Cell content ──────────────────────────────────────────────────────────
    required this.cellText,
    this.cellBuilder,
    // ── Layout ────────────────────────────────────────────────────────────────
    this.textAlign,
    this.width,
    // ── Sort ──────────────────────────────────────────────────────────────────
    this.sortable = false,
    this.sort,
    // ── Cell interactions ─────────────────────────────────────────────────────
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
  });

  // ── Header ──────────────────────────────────────────────────────────────────

  /// Fallback plain-text column label.
  final String headerText;

  /// Custom header widget. When provided, replaces [headerText].
  final Widget? headerBuilder;

  /// Longer description shown as a tooltip on the heading cell.
  final String? tooltip;

  /// Mouse cursor over the heading cell.
  final WidgetStateProperty<MouseCursor?>? mouseCursor;

  // ── Cell content ────────────────────────────────────────────────────────────

  /// Text content for the cell. May return a [Future] for async data.
  /// Ignored when [cellBuilder] is provided.
  final FutureOr<String?> Function(T item, int index) cellText;

  /// Custom cell widget. May return a [Future] for async widgets.
  /// Takes priority over [cellText].
  final FutureOr<Widget?> Function(T item, int index)? cellBuilder;

  // ── Layout ──────────────────────────────────────────────────────────────────

  /// Text alignment for this column. Falls back to [SPDataTableStyle.textAlign].
  final TextAlign? textAlign;

  /// Fixed cell width. When null the column expands to fill available space.
  final double? width;

  // ── Sort ────────────────────────────────────────────────────────────────────

  /// Whether tapping the heading enables sorting.
  final bool sortable;

  /// Custom sort comparator. When null and [sortable] is true, sorts by
  /// [toString] lexicographic order.
  final int Function(T a, T b, bool ascending)? sort;

  // ── Cell interactions ────────────────────────────────────────────────────────

  final void Function(T item, int index)? onTap;
  final void Function(T item, int index)? onDoubleTap;
  final void Function(T item, int index)? onLongPress;

  // ─────────────────────────────────────────────────────────────────────────────

  int _compare(T a, T b, bool ascending) {
    if (sort != null) return sort!(a, b, ascending);
    final cmp = a.toString().compareTo(b.toString());
    return ascending ? cmp : -cmp;
  }
}
