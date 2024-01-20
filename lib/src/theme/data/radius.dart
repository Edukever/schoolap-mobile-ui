import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';

class AppRadiusData extends Equatable {
  const AppRadiusData({
    required this.small,
    required this.regular,
    required this.big,
  });

  const AppRadiusData.primary()
      : small = const Radius.circular(8),
        regular = const Radius.circular(10),
        big = const Radius.circular(30);

  final Radius small;
  final Radius regular;
  final Radius big;

  AppBorderRadiusData asBorderRadius() => AppBorderRadiusData(this);

  @override
  List<Object?> get props => [];
}

class AppBorderRadiusData extends Equatable {
  const AppBorderRadiusData(this._radius);

  BorderRadius get small => BorderRadius.all(_radius.small);
  BorderRadius get regular => BorderRadius.all(_radius.regular);
  BorderRadius get big => BorderRadius.all(_radius.big);

  final AppRadiusData _radius;

  @override
  List<Object?> get props => [_radius];
}
