part of '../widget.dart';

class SPPagination extends StatelessWidget {
  const SPPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
    this.siblingCount = 1,
    this.boundaryCount = 1,
  })  : assert(totalPages > 0, 'totalPages must be greater than 0'),
        assert(
          currentPage >= 1 && currentPage <= totalPages,
          'currentPage must be between 1 and totalPages',
        );

  final int currentPage;
  final int totalPages;
  final void Function(int page) onPageChanged;

  /// Number of page buttons shown on each side of the current page.
  final int siblingCount;

  /// Number of page buttons always shown at the start and end of the range.
  final int boundaryCount;

  // ── Helpers ──────────────────────────────────────────────────────────────────

  int get _siblingSpan {
    if (currentPage == 1 || currentPage == totalPages) {
      return math.max(2, siblingCount);
    }
    if (currentPage == 2 || currentPage == totalPages - 1) {
      return math.max(1, siblingCount);
    }
    return siblingCount;
  }

  bool get _showLeftEllipsis => currentPage - _siblingSpan - boundaryCount > 1;

  bool get _showRightEllipsis =>
      totalPages - boundaryCount - (currentPage + _siblingSpan) > 0;

  void _go(int page) {
    if (page >= 1 && page <= totalPages) onPageChanged(page);
  }

  // ── Widgets ──────────────────────────────────────────────────────────────────

  Widget _pageButton(int page, BuildContext context) {
    final theme = AppTheme.of(context);
    final isActive = page == currentPage;
    return GestureDetector(
      onTap: () => _go(page),
      child: Container(
        constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: isActive ? theme.colors.blue : theme.colors.blueLight,
          borderRadius: BorderRadius.all(theme.radius.small),
        ),
        alignment: Alignment.center,
        child: SPText.title2(
          '$page',
          style: TextStyle(
            color: isActive ? theme.colors.white : theme.colors.gray2,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _ellipsis(BuildContext context) {
    final theme = AppTheme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: SPText.title2(
        '…',
        style: TextStyle(
          color: theme.colors.gray2,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget _navButton({
    required BuildContext context,
    required String iconData,
    required int target,
  }) {
    final theme = AppTheme.of(context);
    return SPButtonIcon(
      iconData: iconData,
      shape: ButtonIconShape.square,
      filledColor: theme.colors.blueLight,
      height: 45,
      width: 45,
      onPressed: () => _go(target),
    );
  }

  @override
  Widget build(BuildContext context) {
    final span = _siblingSpan;

    // Pages to render between ellipses
    final leftSiblings = List.generate(span, (i) => currentPage - i - 1)
        .reversed
        .where((p) => p >= 1)
        .toList();
    final rightSiblings = List.generate(span, (i) => currentPage + i + 1)
        .where((p) => p <= totalPages)
        .toList();

    // Boundary pages not already covered by siblings or the current page
    final covered = {currentPage, ...leftSiblings, ...rightSiblings};
    final leftBoundaries = List.generate(boundaryCount, (i) => i + 1)
        .where((p) => !covered.contains(p))
        .toList();
    final rightBoundaries =
        List.generate(boundaryCount, (i) => totalPages - i)
            .reversed
            .where((p) => !covered.contains(p))
            .toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // ── Prev ──────────────────────────────────────────────────────────────
        _navButton(
          context: context,
          iconData: AppIconsData.arrowLeft,
          target: currentPage - 1,
        ),
        const Spacer(),
        // ── Left boundary ─────────────────────────────────────────────────────
        ...leftBoundaries.map((p) => _pageButton(p, context)),
        if (_showLeftEllipsis) _ellipsis(context),
        // ── Left siblings ─────────────────────────────────────────────────────
        ...leftSiblings.map((p) => _pageButton(p, context)),
        // ── Current ───────────────────────────────────────────────────────────
        _pageButton(currentPage, context),
        // ── Right siblings ────────────────────────────────────────────────────
        ...rightSiblings.map((p) => _pageButton(p, context)),
        if (_showRightEllipsis) _ellipsis(context),
        // ── Right boundary ────────────────────────────────────────────────────
        ...rightBoundaries.map((p) => _pageButton(p, context)),
        // ── Next ──────────────────────────────────────────────────────────────
        const Spacer(),
        _navButton(
          context: context,
          iconData: AppIconsData.arrowRight,
          target: currentPage + 1,
        ),
      ],
    );
  }
}
