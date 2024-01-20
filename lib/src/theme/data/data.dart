import 'package:equatable/equatable.dart';
import 'package:schoolap_ui/src/theme/data/colors.dart';
import 'package:schoolap_ui/src/theme/data/gradient.dart';
import 'package:schoolap_ui/src/theme/data/radius.dart';

import 'typography.dart';

class AppThemeData extends Equatable {
  const AppThemeData({
    required this.colors,
    required this.radius,
    required this.gradient,
    required this.typography,
  });
  final SPColorsData colors;
  final AppRadiusData radius;
  final SPGradientData gradient;
  final AppTypographyData typography;

  factory AppThemeData.defaultThemeData() {
    final colors = SPColorsData.defaultColors();
    return AppThemeData(
      colors: colors,
      radius: const AppRadiusData.primary(),
      gradient: SPGradientData.defaultGradient(colors),
      typography: AppTypographyData.regular(),
    );
  }

  @override
  List<Object?> get props => [];
}
