part of '../widget.dart';

class CustomPopupMenu extends StatelessWidget {
  final String iconPath;
  final Color? iconColor;
  final List<PopupMenuEntry<int>> items;

  const CustomPopupMenu({
    Key? key,
    required this.iconPath,
    required this.items,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      onSelected: (value) {},
      icon: SvgPicture.asset(
        iconPath,
        colorFilter: iconColor != null
            ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
            : null,
      ),
      itemBuilder: (BuildContext context) {
        return items;
      },
    );
  }
}

class HorizontalPopupMenuItem extends PopupMenuItem<int> {
  @override
  final Widget child;

  HorizontalPopupMenuItem({
    super.key,
    required this.child,
    required int value,
  }) : super(
          value: value,
          child: Row(
            children: <Widget>[
              child,
            ],
          ),
        );
}

// class ListItems extends StatelessWidget {
//   const ListItems({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.all(8),
//         children: const [
//           IconWithText(
//             label: "Entry A",
//           ),
//           VerticalDivider(),
//           IconWithText(
//             label: "Entry B",
//           ),
//           VerticalDivider(),
//           IconWithText(
//             label: "Entry C",
//           ),
//         ],
//       ),
//     );
//   }
// }

// class IconWithText extends StatelessWidget {
//   final void Function()? onTap;
//   final double? height;
//   final double? width;
//   final String label;

//   const IconWithText({
//     Key? key,
//     this.height,
//     this.width,
//     required this.label,
//     this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: SizedBox(
//         height: height ?? 100,
//         width: width ?? 70,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               const Icon(Icons.abc),
//               Text(label), // Replace with your custom text widget
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
