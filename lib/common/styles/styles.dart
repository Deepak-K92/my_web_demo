import 'package:flutter/material.dart';
import 'package:my_web_demo/common/styles/app_colors.dart';

class AppCustomTextStyles {
  TextStyle mainHeaderTextStyle = TextStyle(
    color: AppColors.kPrimaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 80,
    shadows: [
      BoxShadow(
        color: Colors.grey.shade900,
        offset: const Offset(1, 1),
      ),
    ],
  );
}

extension GFont on TextStyle {
  TextStyle setGFont({required TextStyle style}) {
    return style.copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        shadows: shadows);
  }
}

extension Copy on TextStyle {
  TextStyle copyWith({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    List<Shadow>? shadows,
  }) {
    return TextStyle(
        fontSize: fontSize ?? this.fontSize,
        color: color ?? this.color,
        fontWeight: fontWeight ?? this.fontWeight,
        shadows: shadows ?? this.shadows);
  }
}
