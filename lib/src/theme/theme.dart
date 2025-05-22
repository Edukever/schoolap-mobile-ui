import 'package:flutter/material.dart';

import 'data/data.dart';

export 'data/data.dart';
export 'data/colors.dart';
export 'data/icons.dart';
export 'data/radius.dart';
export 'data/illustrations.dart';

class AppTheme extends InheritedWidget {
  const AppTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final AppThemeData data;

  static AppThemeData of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    return widget!.data;
  }

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) {
    return data != oldWidget.data;
  }
}
