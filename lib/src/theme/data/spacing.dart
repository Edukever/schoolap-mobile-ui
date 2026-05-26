import 'package:equatable/equatable.dart';

class AppSpacingData extends Equatable {
  const AppSpacingData({
    required this.extraSmall,
    required this.small,
    required this.medium,
    required this.large,
    required this.extraLarge,
    @Deprecated('Use medium instead.') double? regular,
    @Deprecated('Use extraLarge instead.') double? big,
  });

  factory AppSpacingData.defaultSpacing() => const AppSpacingData(
        extraSmall: 4,
        small: 8,
        medium: 12,
        large: 20,
        extraLarge: 32,
      );

  final double extraSmall;
  final double small;
  final double medium;
  final double large;
  final double extraLarge;

  @Deprecated('Use medium instead.')
  double get regular => medium;

  @Deprecated('Use extraLarge instead.')
  double get big => extraLarge;

  @Deprecated('Use small instead.')
  double get semiSmall => small;

  @Deprecated('Use large instead.')
  double get semiBig => large;

  @override
  List<Object?> get props => [];
}
