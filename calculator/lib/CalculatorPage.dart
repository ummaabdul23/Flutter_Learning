// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:calculator/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
  }

class _CalculatorPageState extends State<CalculatorPage> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText) {
    // used to check if the result contains a decimal
    String doesContainDecimal(dynamic result) {
      if (result.toString().contains('.')) {
        List<String> splitDecimal = result.toString().split('.');
        if (!(int.parse(splitDecimal[1]) > 0)) {
          return result = splitDecimal[0].toString();
        }
      }
      return result;
    }

    setState(() {
      if (buttonText == "AC") {
        equation = "0";
        result = "0";
      } else if (buttonText == "<-") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "+/-") {
        if (equation[0] != '-') {
          equation = '-$equation';
        } else {
          equation = equation.substring(1);
        }
      } else if (buttonText == "=") {
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('%', '%');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          if (expression.contains('%')) {
            result = doesContainDecimal(result);
          }
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: const Icon(Icons.settings, color: Colors.black),
          actions: const [
            Padding(padding: EdgeInsets.only(top: 18.0),
          child: Text('DEG', style: TextStyle(color: Colors.black)),),
          SizedBox(width:20),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(result, textAlign: TextAlign.left,
                          style: const TextStyle(color: Colors.black,
                          fontSize: 80))
                        ),
                        const Icon(Icons.more_vert, color:Colors.black, size: 30),
                        const SizedBox(width: 20),
                      ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(equation,
                          style: const TextStyle(color: Colors.black,
                          fontSize: 40,)),
                        ),
                        IconButton(icon: const Icon(Icons.backspace_outlined,), color:Colors.black, iconSize: 30,
                        onPressed: () {
                          buttonPressed("<-");
                        },
                    ),
                    const SizedBox(width: 20),
                      ],
                    ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  myButton('AC', Colors.white10, () => buttonPressed('AC')),
                  myButton('%', Colors.white10, () => buttonPressed('%')),
                  myButton('÷', Colors.white10, () => buttonPressed('÷')),
                  myButton("×", Colors.white10, () => buttonPressed('×')),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  myButton('7', Colors.white10, () => buttonPressed('7')),
                  myButton('8', Colors.white10, () => buttonPressed('8')),
                  myButton('9', Colors.white10, () => buttonPressed('9')),
                  myButton("-", Colors.white10, () => buttonPressed('-')),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  myButton('4', Colors.white10, () => buttonPressed('4')),
                  myButton('5', Colors.white10, () => buttonPressed('5')),
                  myButton('6', Colors.white10, () => buttonPressed('6')),
                  myButton("+", Colors.white10, () => buttonPressed('+')),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  myButton('1', Colors.white10, () => buttonPressed('1')),
                  myButton('2', Colors.white10, () => buttonPressed('2')),
                  myButton('3', Colors.white10, () => buttonPressed('3')),
                  myButton('=', Colors.white10, () => buttonPressed('=')),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  myButton('0', Colors.white10, () => buttonPressed('0')),
                  myButton('.', Colors.white10, () => buttonPressed('.')),
                  myButton('+/-', Colors.white10, () => buttonPressed('+/-')),
                ],
              ),
              const SizedBox(height: 10),
          ],
         ),
      ),
<<<<<<< HEAD
=======
      myButton('=', Colors.white10, () => buttonPressed('='))
>>>>>>> ce0cfed5257809fd7faff2fb43971a7ed172bf44
    )
  ],
        ),
      )
    );
  }
}