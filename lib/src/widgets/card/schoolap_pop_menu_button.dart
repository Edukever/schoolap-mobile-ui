part of '../widget.dart';

class SPListItem<T> extends Equatable {
  final String label;
  final String iconPath;
  final T value;

  const SPListItem({
    required this.label,
    required this.iconPath,
    required this.value,
  });

  @override
  List<Object?> get props => [label, iconPath, value];
}

class SPPopMenuButton<T> extends StatelessWidget {
  final String iconPath;
  final Color? iconColor;
  final List<SPListItem<T>> items;
  final void Function(T)? handleIconTap;
  final bool barrierDismissible;
  final double? arrowDxOffset;
  final double? arrowDyOffset;
  final double? contentDxOffset;
  final double? contentDyOffset;
  final double? height;
  final double? width;

  const SPPopMenuButton({
    Key? key,
    required this.iconPath,
    required this.items,
    this.iconColor,
    this.handleIconTap,
    this.barrierDismissible = true,
    this.arrowDxOffset,
    this.arrowDyOffset,
    this.contentDxOffset,
    this.contentDyOffset,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        showPopover(
          barrierDismissible: barrierDismissible,
          barrierColor: Colors.transparent,
          context: context,
          bodyBuilder: (context) => ListItems<T>(
            onTap: handleIconTap,
            items: items,
          ),
          onPop: () => debugPrint('Popover was popped!'),
          direction: PopoverDirection.bottom,
          height: height ?? 100,
          width: width ?? 290,
          arrowHeight: 0,
          arrowWidth: 0,
          arrowDxOffset: arrowDxOffset ?? -140,
          arrowDyOffset: arrowDyOffset ?? 0,
          contentDxOffset: contentDxOffset ?? 0,
          contentDyOffset: contentDyOffset ?? 0,
        );
      },
      icon: SvgPicture.asset(
        iconPath,
        colorFilter: iconColor != null ? ColorFilter.mode(iconColor!, BlendMode.srcIn) : null,
      ),
    );
  }
}

class ListItems<T> extends StatelessWidget {
  final void Function(T)? onTap;
  final List<SPListItem<T>> items;

  const ListItems({Key? key, this.onTap, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        items.length,
        (index) => ItemTile<T>(
          listItem: items[index],
          middle: index == 1,
          onTap: () => onTap?.call(items[index].value),
        ),
      ),
    );
  }
}

class ItemTile<T> extends StatelessWidget {
  const ItemTile({
    Key? key,
    required this.listItem,
    this.middle = false,
    this.onTap,
  }) : super(key: key);

  final SPListItem<T> listItem;
  final bool middle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 80,
      height: 60,
      decoration: BoxDecoration(
        border: Border(
          right: !middle ? BorderSide.none : const BorderSide(color: Colors.grey),
          left: !middle ? BorderSide.none : const BorderSide(color: Colors.grey),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(listItem.iconPath),
                const SizedBox(height: 10),
                SPText.paragraph2(listItem.label),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
