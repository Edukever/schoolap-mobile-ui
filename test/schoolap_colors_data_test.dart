import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:schoolap_ui/schoolap_ui.dart';

void main() {
  test('default colors expose English token names', () {
    final colors = SPColorsData.defaultColors();

    expect(colors.red.toARGB32(), 0xFFFF4F4F);
    expect(colors.black.toARGB32(), 0xFF292D32);
    expect(colors.gray2.toARGB32(), 0xFFAAAAAA);
    expect(colors.white.toARGB32(), 0xFFFFFFFF);
    expect(colors.green.toARGB32(), 0xFF1EA951);
    expect(colors.blue.toARGB32(), 0xFF17418A);
    expect(colors.yellow.toARGB32(), 0xFFF2B200);
  });

  test('deprecated French token names point to English names', () {
    final colors = SPColorsData.defaultColors();

    // ignore: deprecated_member_use_from_same_package
    expect(colors.rouge, colors.red);
    // ignore: deprecated_member_use_from_same_package
    expect(colors.rougeLight, colors.redLight);
    // ignore: deprecated_member_use_from_same_package
    expect(colors.noir, colors.black);
    // ignore: deprecated_member_use_from_same_package
    expect(colors.grid3, colors.gray3);
    // ignore: deprecated_member_use_from_same_package
    expect(colors.grid2, colors.gray2);
    // ignore: deprecated_member_use_from_same_package
    expect(colors.grid1, colors.gray1);
    // ignore: deprecated_member_use_from_same_package
    expect(colors.gridLight, colors.grayLight);
    // ignore: deprecated_member_use_from_same_package
    expect(colors.blanc, colors.white);
    // ignore: deprecated_member_use_from_same_package
    expect(colors.vert, colors.green);
    // ignore: deprecated_member_use_from_same_package
    expect(colors.vertLight, colors.greenLight);
    // ignore: deprecated_member_use_from_same_package
    expect(colors.bleu, colors.blue);
    // ignore: deprecated_member_use_from_same_package
    expect(colors.bleuLight, colors.blueLight);
    // ignore: deprecated_member_use_from_same_package
    expect(colors.jaune, colors.yellow);
    // ignore: deprecated_member_use_from_same_package
    expect(colors.jauneLight, colors.yellowLight);
    // ignore: deprecated_member_use_from_same_package
    expect(colors.jaune1, colors.yellow1);
  });

  test('deprecated French constructor parameters still configure tokens', () {
    const customRed = Color(0xFFAA0000);
    const customYellow = Color(0xFFBBBB00);

    const colors = SPColorsData(
      // ignore: deprecated_member_use_from_same_package
      rouge: customRed,
      // ignore: deprecated_member_use_from_same_package
      jaune1: customYellow,
    );

    expect(colors.red, customRed);
    expect(colors.yellow1, customYellow);
    // ignore: deprecated_member_use_from_same_package
    expect(colors.rouge, customRed);
    // ignore: deprecated_member_use_from_same_package
    expect(colors.jaune1, customYellow);
  });
}
