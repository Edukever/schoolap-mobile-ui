import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';

class AppRadiusData extends Equatable {
  const AppRadiusData({
    this.none = Radius.zero,
    this.extraSmall = const Radius.circular(4),
    this.small = const Radius.circular(8),
    this.medium = const Radius.circular(10),
    this.large = const Radius.circular(14),
    this.extraLarge = const Radius.circular(20),
    this.full = const Radius.circular(30),
    @Deprecated('Use medium instead.') Radius? regular,
    @Deprecated('Use full instead.') Radius? big,
  });

  const AppRadiusData.primary()
      : none = Radius.zero,
        extraSmall = const Radius.circular(4),
        small = const Radius.circular(8),
        medium = const Radius.circular(10),
        large = const Radius.circular(14),
        extraLarge = const Radius.circular(20),
        full = const Radius.circular(30);

  final Radius none;
  final Radius extraSmall;
  final Radius small;
  final Radius medium;
  final Radius large;
  final Radius extraLarge;
  final Radius full;

  @Deprecated('Use medium instead.')
  Radius get regular => medium;

  @Deprecated('Use full instead.')
  Radius get big => full;

  AppBorderRadiusData asBorderRadius() => AppBorderRadiusData(this);

  @override
  List<Object?> get props => [
        none,
        extraSmall,
        small,
        medium,
        large,
        extraLarge,
        full,
      ];
}

class AppBorderRadiusData extends Equatable {
  const AppBorderRadiusData(this._radius);

  BorderRadius get none => BorderRadius.all(_radius.none);
  BorderRadius get extraSmall => BorderRadius.all(_radius.extraSmall);
  BorderRadius get small => BorderRadius.all(_radius.small);
  BorderRadius get medium => BorderRadius.all(_radius.medium);
  BorderRadius get large => BorderRadius.all(_radius.large);
  BorderRadius get extraLarge => BorderRadius.all(_radius.extraLarge);
  BorderRadius get full => BorderRadius.all(_radius.full);

  @Deprecated('Use medium instead.')
  BorderRadius get regular => medium;

  @Deprecated('Use full instead.')
  BorderRadius get big => full;

  final AppRadiusData _radius;

  @override
  List<Object?> get props => [_radius];
}
