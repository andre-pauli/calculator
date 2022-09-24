import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:calculator/database/database.dart';
import 'package:calculator/utils/converter.dart';
import 'package:calculator/utils/enumerates.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = '0';

  double firstValue = 0;
  double secondValue = 0;

  bool isTyping = false;

  TypeButton selectedOperation = TypeButton.none;
  TypeButton pressButton = TypeButton.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    result,
                    style: const TextStyle(fontSize: 80.0),
                  ),
                ],
              )),
          Column(
            children: List.generate(
                Database.buttons.length,
                (index) => Container(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          Database.buttons[index].length,
                          (indexChild) => getButton(
                              color: Database.buttons[index][indexChild].color!,
                              content:
                                  Database.buttons[index][indexChild].content!,
                              contentColor: Database
                                  .buttons[index][indexChild].contentColor!,
                              typeButon: Database
                                  .buttons[index][indexChild].typeButon!,
                              selectedTypeButon: pressButton,
                              width: Database.buttons[index][indexChild].width),
                        )))),
          ),
          const SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }

  Widget getButton(
      {required Color color,
      required String content,
      required Color contentColor,
      required TypeButton typeButon,
      required TypeButton selectedTypeButon,
      double? width}) {
    return GestureDetector(
      onTap: () => operation(typeButon: typeButon, content: content),
      child: Container(
        width: width ?? 80,
        height: 80,
        decoration: BoxDecoration(
            color: typeButon == selectedTypeButon ? Colors.white : color,
            border: Border.all(),
            borderRadius: const BorderRadius.all(Radius.circular(50))),
        child: Center(
          child: Text(
            content,
            style: TextStyle(
                fontSize: 40.0,
                color: typeButon == selectedTypeButon
                    ? Colors.black
                    : contentColor),
          ),
        ),
      ),
    );
  }

  void operation({required TypeButton typeButon, required String content}) {
    switch (typeButon) {
      case TypeButton.clean:
        clearCalculator();
        break;
      case TypeButton.number:
      case TypeButton.dot:
        pressNumber(content);
        break;
      case TypeButton.equal:
        pressEqual();
        break;
      case TypeButton.addition:
        pressOperation(typeButton: typeButon);
        break;
      case TypeButton.subtraction:
        pressOperation(typeButton: typeButon);
        break;
      case TypeButton.multiplication:
        pressOperation(typeButton: typeButon);
        break;
      case TypeButton.division:
        pressOperation(typeButton: typeButon);
        break;
      default:
    }

    setState(() {});
  }

  void clearCalculator() {
    setState(() {
      selectedOperation = TypeButton.none;
      pressButton = TypeButton.none;
      firstValue = 0;
      secondValue = 0;
      result = '0';
    });
  }

  void pressNumber(String content) {
    if (content == ',') content = '.';
    pressButton = TypeButton.none;
    if (!isTyping) {
      result = content;
      isTyping = true;
    } else {
      result += content;
      result = result.replaceAll(',', '');
    }

    result = Converter.getResult(double.parse(result), content == '.');
  }

  void pressOperation({required TypeButton typeButton}) {
    if (firstValue != 0) {
      pressEqual();
    }
    isTyping = false;
    pressButton = typeButton;
    selectedOperation = typeButton;
    firstValue = double.parse(result.replaceAll(',', ''));
  }

  void pressEqual() {
    result.replaceAll(',', '');
    secondValue = double.parse(result);
    isTyping = false;

    switch (selectedOperation) {
      case TypeButton.addition:
        result = Converter.getResult((firstValue + secondValue), false);
        break;
      case TypeButton.subtraction:
        result = Converter.getResult((firstValue - secondValue), false);
        break;
      case TypeButton.multiplication:
        result = Converter.getResult((firstValue * secondValue), false);
        break;
      case TypeButton.division:
        result = Converter.getResult((firstValue / secondValue), false);
        break;
      default:
    }
    selectedOperation = TypeButton.none;
  }
}
