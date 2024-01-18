import 'package:flutter/widgets.dart';

enum StateIcon {
  none,
  filled,
  outlined,
}

enum StateFormIcon {
  none,
  square,
  circle,
}

class AppIconButton extends StatelessWidget {
  final String? iconData;
  final StateIcon? state;
  final StateFormIcon? formState;
  final double? width;
  final double? height;
  const AppIconButton(
      {super.key,
      this.state,
      this.formState,
      this.width,
      this.height,
      this.iconData});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
