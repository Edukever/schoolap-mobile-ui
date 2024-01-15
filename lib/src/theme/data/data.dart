import 'package:equatable/equatable.dart';
import 'package:schoolap_pkg/src/theme/data/colors.dart';
import 'package:schoolap_pkg/src/theme/data/gradient.dart';
import 'package:schoolap_pkg/src/theme/data/icons.dart';
import 'package:schoolap_pkg/src/theme/data/radius.dart';

class AppThemeData extends Equatable {
  const AppThemeData({
    required this.colors,
    required this.radius,
    required this.gradient,
    required this.icons,
  });
  final AppColorsData colors;
  final AppRadiusData radius;
  final AppGradientData gradient;
  final AppIconsData icons;

  @override
  List<Object?> get props => [];
}
