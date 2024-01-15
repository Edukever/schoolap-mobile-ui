import 'package:equatable/equatable.dart';
import 'package:schoolap_pkg/src/theme/data/colors.dart';
import 'package:schoolap_pkg/src/theme/data/gradient.dart';
import 'package:schoolap_pkg/src/theme/data/radius.dart';

class AppThemeData extends Equatable {
  const AppThemeData({
    required this.colors,
    required this.radius,
    required this.gradient,
  });
  final AppColorsData colors;
  final AppRadiusData radius;
  final AppGradientData gradient;

  factory AppThemeData.defaultThemeData() {
    final colors = AppColorsData.defaultColors();
    return AppThemeData(
      colors: colors,
      radius: const AppRadiusData.primary(),
      gradient: AppGradientData.defaultGradient(colors),
    );
  }

  @override
  List<Object?> get props => [];
}
