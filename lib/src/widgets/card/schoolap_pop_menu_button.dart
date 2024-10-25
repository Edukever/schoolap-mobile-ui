part of '../widget.dart';

class SPListItem<T> extends Equatable {
  final String iconPath;
  final String label;
  final T value;

  const SPListItem({
    required this.iconPath,
    required this.label,
    required this.value,
  });

  @override
  List<Object?> get props => [label, iconPath, value];
}

class SPPopMenuButton<T> extends StatefulWidget {
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
    super.key,
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
  });

  @override
  State<SPPopMenuButton<T>> createState() => _SPPopMenuButtonState<T>();
}

class _SPPopMenuButtonState<T> extends State<SPPopMenuButton<T>> {
  final GlobalKey _iconKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  void _showMenu() {
    final RenderBox renderBox = _iconKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    _overlayEntry = _createOverlayEntry(offset, size);
    Overlay.of(context).insert(_overlayEntry!);
  }

  OverlayEntry _createOverlayEntry(Offset offset, Size size) {
    double maxWidth = (widget.items.length * 70).toDouble();

    double itemWidth = 70.0; // Adjust based on your design
    double left = offset.dx;

    if (left + maxWidth > MediaQuery.of(context).size.width) {
      left = MediaQuery.of(context).size.width - maxWidth - 90.0;
    }

    return OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () => _removeOverlay(),
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            Positioned(
              left: left + (widget.arrowDxOffset ?? (MediaQuery.of(context).orientation == Orientation.landscape ? -20.0 : 0)),
              top: offset.dy + size.height + (widget.arrowDyOffset ?? 0),
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  height: widget.height ?? 75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: _buildMenuItems(itemWidth),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildMenuItems(double itemWidth) {
    return List<Widget>.generate(widget.items.length, (index) {
      final item = widget.items[index];
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (index != 0) const VerticalDivider(),
          GestureDetector(
            onTap: () {
              widget.handleIconTap?.call(item.value);
              _removeOverlay();
            },
            child: Container(
              width: itemWidth,
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(item.iconPath),
                  const SizedBox(height: 4.0),
                  AutoSizeText(
                    item.label,
                    textAlign: TextAlign.center,
                    minFontSize: 10.0,
                    style: const TextStyle(fontSize: 12.0),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: _iconKey,
      icon: SvgPicture.asset(
        widget.iconPath,
        colorFilter: widget.iconColor == null ? null : ColorFilter.mode(widget.iconColor!, BlendMode.srcIn),
      ),
      onPressed: _showMenu,
    );
  }
}
