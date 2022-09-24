import 'package:flutter/material.dart';
import 'package:calculator/models/button_model.dart';
import 'package:calculator/utils/enumerates.dart';
import 'package:calculator/utils/system_colors.dart';

class Database {
  static List buttons = [
    [
      ButtonModel(
          color: SystemColors.greyAccent,
          content: 'AC',
          typeButon: TypeButton.clean,
          contentColor: Colors.black),
      ButtonModel(
          color: SystemColors.greyAccent,
          content: '',
          typeButon: TypeButton.clean,
          contentColor: Colors.black),
      ButtonModel(
          color: SystemColors.greyAccent,
          content: '',
          typeButon: TypeButton.clean,
          contentColor: Colors.black),
      ButtonModel(
          color: SystemColors.orange,
          content: '/',
          typeButon: TypeButton.division,
          contentColor: Colors.white),
    ],
    [
      ButtonModel(
          color: SystemColors.grey,
          content: '7',
          typeButon: TypeButton.number,
          contentColor: Colors.white),
      ButtonModel(
          color: SystemColors.grey,
          typeButon: TypeButton.number,
          content: '8',
          contentColor: Colors.white),
      ButtonModel(
          color: SystemColors.grey,
          content: '9',
          typeButon: TypeButton.number,
          contentColor: Colors.white),
      ButtonModel(
          color: SystemColors.orange,
          content: 'X',
          typeButon: TypeButton.multiplication,
          contentColor: Colors.white),
    ],
    [
      ButtonModel(
          color: SystemColors.grey,
          content: '4',
          typeButon: TypeButton.number,
          contentColor: Colors.white),
      ButtonModel(
          color: SystemColors.grey,
          content: '5',
          typeButon: TypeButton.number,
          contentColor: Colors.white),
      ButtonModel(
          color: SystemColors.grey,
          content: '6',
          typeButon: TypeButton.number,
          contentColor: Colors.white),
      ButtonModel(
          color: SystemColors.orange,
          content: '-',
          typeButon: TypeButton.subtraction,
          contentColor: Colors.white),
    ],
    [
      ButtonModel(
          color: SystemColors.grey,
          content: '1',
          typeButon: TypeButton.number,
          contentColor: Colors.white),
      ButtonModel(
          color: SystemColors.grey,
          content: '2',
          typeButon: TypeButton.number,
          contentColor: Colors.white),
      ButtonModel(
          color: SystemColors.grey,
          content: '3',
          typeButon: TypeButton.number,
          contentColor: Colors.white),
      ButtonModel(
          color: SystemColors.orange,
          content: '+',
          typeButon: TypeButton.addition,
          contentColor: Colors.white),
    ],
    [
      ButtonModel(
          color: SystemColors.grey,
          content: '0',
          typeButon: TypeButton.number,
          contentColor: Colors.white,
          width: 190.0),
      ButtonModel(
          color: SystemColors.grey,
          content: ',',
          typeButon: TypeButton.dot,
          contentColor: Colors.white),
      ButtonModel(
          color: SystemColors.orange,
          content: '=',
          typeButon: TypeButton.equal,
          contentColor: Colors.white),
    ],
  ];
}
