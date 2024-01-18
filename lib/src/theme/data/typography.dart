import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';

class AppTypographyData extends Equatable {
  const AppTypographyData({
    required this.paragraph1,
    required this.paragraph2,
    required this.title1,
    required this.title2,
    required this.title3,
  });

  factory AppTypographyData.regular() => const AppTypographyData(
        paragraph1: TextStyle(
          fontFamily: 'Poppins',
          package: 'schoolap_ui',
          fontWeight: FontWeight.w400,
          fontSize: 12,
          decoration: TextDecoration.none,
        ),
        paragraph2: TextStyle(
          fontFamily: 'Poppins',
          package: 'schoolap_ui',
          fontWeight: FontWeight.w400,
          fontSize: 10,
          decoration: TextDecoration.none,
        ),
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
      );

  factory AppTypographyData.small() => const AppTypographyData(
        paragraph1: TextStyle(
          fontFamily: 'Poppins',
          package: 'schoolap_ui',
          fontWeight: FontWeight.w400,
          fontSize: 10,
          decoration: TextDecoration.none,
        ),
        paragraph2: TextStyle(
          fontFamily: 'Poppins',
          package: 'schoolap_ui',
          fontWeight: FontWeight.w400,
          fontSize: 9,
          decoration: TextDecoration.none,
        ),
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
      );

  final TextStyle paragraph1;
  final TextStyle paragraph2;
  final TextStyle title1;
  final TextStyle title2;
  final TextStyle title3;

  @override
  List<Object?> get props => [];
}
