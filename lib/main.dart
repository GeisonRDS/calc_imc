import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = 'Informe seus dados!';

  void _resetFields() {
    weightController.text = '';
    heightController.text = '';
    setState(() {
      _infoText = 'Informe seus dados!';
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double hxh = (height * height);
      double imc = weight / hxh;
      print(height);
      print(weight);
      print(hxh);
      print(imc);
      if (imc < 18.6) {
        _infoText = 'Abaixo do peso (${imc.toStringAsPrecision(3)}).';
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = 'Peso ideal (${imc.toStringAsPrecision(3)}).';
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = 'Levemente acima do peso (${imc.toStringAsPrecision(3)}).';
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = 'Obesidade grau I (${imc.toStringAsPrecision(3)}).';
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = 'Obesidade grau II (${imc.toStringAsPrecision(3)}).';
      } else if (imc >= 39.9) {
        _infoText = 'Obesidade grau III (${imc.toStringAsPrecision(3)}).';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculadora de IMC'),
          centerTitle: true,
          backgroundColor: Colors.green,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetFields,
            )
          ],
        ),
        backgroundColor: Colors.green,
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(
                    Icons.person_outline,
                    size: 120.0,
                    color: Colors.white,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Peso (kg)',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                    cursorColor: Colors.white,
                    controller: weightController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Insira seu peso!';
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Altura (cm)',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                    cursorColor: Colors.white,
                    controller: heightController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira sua Altura!";
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                    child: Container(
                      height: 60.0,
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _calculate();
                          }
                        },
                        child: Text(
                          'CALCULAR',
                          style: TextStyle(color: Colors.green, fontSize: 25.0),
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 350.0,
                    child: ListView(
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,

                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 60, right: 40.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40)),
                          width: 300.0,
                          child: Card(
                            child: Wrap(
                              children: <Widget>[
                                ListTile(
                                  title: Text(_infoText),
                                  subtitle: Text(
                                      'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla '),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 40.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40)),
                          width: 300.0,
                          child: Card(
                            child: Wrap(
                              children: <Widget>[
                                ListTile(
                                  title: Text(_infoText),
                                  subtitle: Text(
                                      'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla '),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 80),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40)),
                          width: 300.0,
                          child: Card(
                            child: Wrap(
                              children: <Widget>[
                                ListTile(
                                  title: Text(_infoText),
                                  subtitle: Text(
                                      'bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla '),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
