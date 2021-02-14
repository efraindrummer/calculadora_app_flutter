import 'package:calculadora_app/widgets/CalcButton.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(CalculadoraApp());


class CalculadoraApp extends StatefulWidget {
  CalculadoraApp({Key key}) : super(key: key);

  @override
  CalculadoraAppState createState() => CalculadoraAppState();
}


class CalculadoraAppState extends State<CalculadoraApp> {

  String _history = '';
  String _expression = '';
  
  void numeroClick(String text){
    setState(() {
      _expression += text;
    });
  }

  void limpiarClick(String text){
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void limpiar(String text){
    setState(() {
      _expression = '';
    });
  }

  void evaluar(String text){

    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel numero = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, numero);

    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      home: Scaffold(
        backgroundColor: Colors.yellow,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            
            Container(
              padding: EdgeInsets.only(right: 12),
              child: Text(_history, style: GoogleFonts.rubik(
                textStyle: TextStyle(
                  fontSize: 24
                ),
                color: Colors.black
              )),
              alignment: Alignment(1, 1),
            ),

            Container(
              padding: EdgeInsets.all(12),
              child: Text(_expression, style: GoogleFonts.rubik(
                textStyle: TextStyle(
                  fontSize: 48
                ),
                color: Colors.black87 
              )),
              alignment: Alignment(1, 1),
            ),

            SizedBox(height: 40,),

            Card(
              color: Colors.blueGrey[400],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
              )),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CalcButton(
                        text: 'AC',
                        callback: limpiarClick,
                        fillColor: 0xFF6C807F,
                        textSize: 24,
                      ),
                      CalcButton(
                        text: 'C',
                        callback: limpiar,
                        fillColor: 0xFF6C807F
                      ),
                      CalcButton(
                        text: '%',
                        callback: numeroClick,
                        fillColor: 0xFFFFFFFF,
                        textColor: 0xFF65BDAC,
                      ),
                      CalcButton(
                        text: '/',
                        callback: numeroClick,
                        fillColor: 0xFFFFFFFF,
                        textColor: 0xFF65BDAC
                      )
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CalcButton(
                        text: '7',
                        callback: numeroClick,
                      ),
                      CalcButton(
                        text: '8',
                        callback: numeroClick,
                      ),
                      CalcButton(
                        text: '9',
                        callback: numeroClick,
                      ),
                      CalcButton(
                        text: '*',
                        callback: numeroClick,
                        fillColor: 0xFFFFFFFF,
                        textColor: 0xFF65BDAC
                      )
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CalcButton(
                        text: '4',
                        callback: numeroClick,
                      ),
                      CalcButton(
                        text: '5',
                        callback: numeroClick,
                      ),
                      CalcButton(
                        text: '6',
                        callback: numeroClick,
                      ),
                      CalcButton(
                        text: '-',
                        callback: numeroClick,
                        fillColor: 0xFFFFFFFF,
                        textColor: 0xFF65BDAC
                      )
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CalcButton(
                        text: '1',
                        callback: numeroClick,
                      ),
                      CalcButton(
                        text: '2',
                        callback: numeroClick,
                      ),
                      CalcButton(
                        text: '3',
                        callback: numeroClick,
                      ),
                      CalcButton(
                        text: '+',
                        callback: numeroClick,
                        fillColor: 0xFFFFFFFF,
                        textColor: 0xFF65BDAC
                      )
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CalcButton(
                        text: '.',
                        callback: numeroClick,
                      ),
                      CalcButton(
                        text: '0',
                        callback: numeroClick,
                      ),
                      CalcButton(
                        text: '00',
                        callback: numeroClick,
                        textSize: 26,
                      ),
                      CalcButton(
                        text: '=',
                        callback: evaluar,
                        fillColor: 0xFFFFFFFF,
                        textColor: 0xFF65BDAC
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}