import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';

class AppTypographyData extends Equatable {
  const AppTypographyData({
    required this.title1,
    required this.title2,
    required this.title3,
    required this.label,
    required this.paragraph1,
    required this.paragraph2,
  });

  factory AppTypographyData.regular() => const AppTypographyData(
        title1: TextStyle(
          fontFamily: 'Poppins',
          package: 'schoolap_ui',
          fontSize: 28,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
        ),
        title2: TextStyle(
          fontFamily: 'Poppins',
          package: 'schoolap_ui',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
        ),
        title3: TextStyle(
          fontFamily: 'Poppins',
          package: 'schoolap_ui',
          fontSize: 14,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
        ),
        label: TextStyle(
          fontFamily: 'Poppins',
          package: 'schoolap_ui',
          fontSize: 11,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.none,
        ),
        paragraph1: TextStyle(
          fontFamily: 'Poppins',
          package: 'schoolap_ui',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.none,
        ),
        paragraph2: TextStyle(
          fontFamily: 'Poppins',
          package: 'schoolap_ui',
          fontSize: 10,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.none,
        ),
      );

  factory AppTypographyData.small() => const AppTypographyData(
        title1: TextStyle(
          fontFamily: 'Poppins',
          package: 'schoolap_ui',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
        ),
        title2: TextStyle(
          fontFamily: 'Poppins',
          package: 'schoolap_ui',
          fontSize: 14,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
        ),
        title3: TextStyle(
          fontFamily: 'Poppins',
          package: 'schoolap_ui',
          fontSize: 12,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
        ),
        label: TextStyle(
          fontFamily: 'Poppins',
          package: 'schoolap_ui',
          fontSize: 9,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.none,
        ),
        paragraph1: TextStyle(
          fontFamily: 'Poppins',
          package: 'schoolap_ui',
          fontSize: 10,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.none,
        ),
        paragraph2: TextStyle(
          fontFamily: 'Poppins',
          package: 'schoolap_ui',
          fontSize: 9,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.none,
        ),
      );

  final TextStyle title1;
  final TextStyle title2;
  final TextStyle title3;
  final TextStyle label;
  final TextStyle paragraph1;
  final TextStyle paragraph2;

  @override
  List<Object?> get props => [];
}
