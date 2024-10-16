part of '../widget.dart';

class SPPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(int page) onPageChanged;
  final int siblingCount = 1;
  final int boundaryCount = 1;
  final MainAxisAlignment mainAxisAlignment;

  const SPPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
    this.mainAxisAlignment = MainAxisAlignment.center,
  })  : assert(totalPages > 0, 'totalPages should be greater than 0'),
        assert(currentPage >= 1 && currentPage <= totalPages, 'currentPage should be between 1 and totalPages');

  bool isBoundary(int index) => index <= boundaryCount || index > totalPages - boundaryCount;

  bool isNotSibling(int index) {
    return ![...List.generate(siblingLength, (index) => currentPage - index - 1), ...List.generate(siblingLength, (index) => currentPage + index + 1)]
        .contains(index);
  }

  bool get showLeftEllipsis {
    final lastSibling = currentPage - siblingLength;
    final lastBoundary = boundaryCount;
    return lastSibling - lastBoundary > 1;
  }

  bool get showRightEllipsis {
    final lastSibling = currentPage + siblingLength;
    final lastBoundary = totalPages - boundaryCount + 1;
    return lastBoundary - lastSibling > 1;
  }

  int get siblingLength {
    if (currentPage == 1 || currentPage == totalPages) return math.max(2, siblingCount);
    if (currentPage == 2 || currentPage == totalPages - 1) return math.max(1, siblingCount);

    return siblingCount;
  }

  void goToPage(int page) {
    if (page >= 1 && page <= totalPages) {
      onPageChanged(page);
    }
  }

  Widget buildPageNumber(int pageNumber, BuildContext context) {
    return GestureDetector(
      onTap: () => goToPage(pageNumber),
      child: Container(
        constraints: const BoxConstraints(minHeight: 40.0, minWidth: 40.0),
        decoration: BoxDecoration(
          color: currentPage == pageNumber ? AppTheme.of(context).colors.bleu : AppTheme.of(context).colors.bleuLight,
          borderRadius: BorderRadius.all(AppTheme.of(context).radius.small),
        ),
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 6.0),
        child: SPText.title2(
          pageNumber.toString(),
          color: currentPage == pageNumber ? AppTheme.of(context).colors.blanc : AppTheme.of(context).colors.grid2,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget itemText(String value) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 6.0),
        child: SPText.title2(
          value.toString(),
          color: AppTheme.of(context).colors.grid2,
          fontWeight: FontWeight.normal,
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SPButtonIcon(
          iconData: AppIconsData.arrowLeft,
          shape: ButtonIconShape.square,
          filledColor: AppTheme.of(context).colors.bleuLight,
          height: 45,
          width: 45,
          onPressed: () => onPageChanged(math.max(currentPage - 1, 1)),
        ),
        const Spacer(),
        ...List.generate(totalPages, (index) => index + 1).map((index) {
          if (currentPage == index) {
            return Row(
              children: [
                if (showLeftEllipsis) itemText('...'),
                ...List.generate(siblingLength, (index) => currentPage - index - 1).reversed.map((index) {
                  if (index < 1) return const SizedBox();
                  if (index > totalPages) return const SizedBox();
                  return itemText(index.toString());
                }),
                Container(
                  constraints: const BoxConstraints(minHeight: 40.0, minWidth: 40.0),
                  decoration: BoxDecoration(
                    color: AppTheme.of(context).colors.bleu,
                    borderRadius: BorderRadius.all(AppTheme.of(context).radius.small),
                  ),
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: SPText.title2(
                    index.toString(),
                    color: AppTheme.of(context).colors.blanc,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                ...List.generate(siblingLength, (index) => currentPage + index + 1).map((index) {
                  if (index < 1) return const SizedBox();
                  if (index > totalPages) return const SizedBox();
                  return itemText(index.toString());
                }),
                if (showRightEllipsis) itemText('...'),
              ],
            );
          }

          if (isBoundary(index) && isNotSibling(index)) return itemText(index.toString());

          return const SizedBox();
        }),
        const Spacer(),
        SPButtonIcon(
          iconData: AppIconsData.arrowRight,
          shape: ButtonIconShape.square,
          filledColor: AppTheme.of(context).colors.bleuLight,
          height: 45,
          width: 45,
          onPressed: () => onPageChanged(math.min(currentPage + 1, totalPages)),
        ),
      ],
    );
  }
}
