import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '';
  final mytextstyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  final List<String> buttons = [
    'AC',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'X',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'ANC',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    userQuestion,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userAnswer,
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    child: Center(
                        child: GridView.builder(
                          
                            itemCount: buttons.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4),
                            itemBuilder: (BuildContext context, int index) {
                              if (index == 0) {
                                return MyButtons(
                                  
                                  buttonTapped: () {
                                    setState(() {
                                      userQuestion = '';
                                    });
                                  },
                                  buttontext: buttons[index],
                                  color: Colors.green,
                                  textColor: Colors.white,
                                
                                );
                              } else if (index == buttons.length - 1) {
                                return MyButtons(
                                  buttonTapped: () {
                                    setState(() {
                                      equalpressed();
                                    });
                                  },
                                  buttontext: buttons[index],
                                  color: Colors.red,
                                  textColor: Colors.white,
                                );
                              } else {
                                return MyButtons(
                                  buttonTapped: () {
                                    setState(() {
                                      userQuestion += buttons[index];
                                    });
                                  },
                                  buttontext: buttons[index],
                                  color: isoperator(buttons[index])
                                      ? Colors.deepPurple
                                      : Colors.black,
                                  textColor: Colors.white,
                                );
                              }
                            })),
                  )))
        ],
      ),
    );
  }

  bool isoperator(String x) {
    if (x == '%' || x == '/' || x == 'X' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalpressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('X', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }
}
