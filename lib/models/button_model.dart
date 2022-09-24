import 'package:flutter/material.dart';
import 'package:calculator/utils/enumerates.dart';

class ButtonModel {
  Color? color;
  String? content;
  TypeButton? typeButon;
  Color? contentColor;
  double? width;

  ButtonModel({
    this.color,
    this.content,
    this.typeButon,
    this.contentColor,
    this.width,
  });
}
