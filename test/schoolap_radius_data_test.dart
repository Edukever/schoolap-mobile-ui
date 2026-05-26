import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

void main() {
  test('default radius scale exposes shared design dimensions', () {
    const radius = AppRadiusData.primary();

    expect(radius.none, Radius.zero);
    expect(radius.extraSmall, const Radius.circular(4));
    expect(radius.small, const Radius.circular(8));
    expect(radius.medium, const Radius.circular(10));
    expect(radius.large, const Radius.circular(14));
    expect(radius.extraLarge, const Radius.circular(20));
    expect(radius.full, const Radius.circular(30));
  });

  test('deprecated radius names point to replacement tokens', () {
    const radius = AppRadiusData.primary();

    // ignore: deprecated_member_use_from_same_package
    expect(radius.regular, radius.medium);
    // ignore: deprecated_member_use_from_same_package
    expect(radius.big, radius.full);

    final borderRadius = radius.asBorderRadius();
    // ignore: deprecated_member_use_from_same_package
    expect(borderRadius.regular, borderRadius.medium);
    // ignore: deprecated_member_use_from_same_package
    expect(borderRadius.big, borderRadius.full);
  });

  test('deprecated constructor parameters still configure tokens', () {
    const regularRadius = Radius.circular(12);
    const bigRadius = Radius.circular(32);

    const radius = AppRadiusData(
      // ignore: deprecated_member_use_from_same_package
      regular: regularRadius,
      // ignore: deprecated_member_use_from_same_package
      big: bigRadius,
    );

    expect(radius.medium, regularRadius);
    expect(radius.full, bigRadius);
  });
}
