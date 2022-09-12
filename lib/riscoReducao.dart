import 'package:flutter/material.dart';

class RiscoReducao extends StatefulWidget {
  const RiscoReducao({Key? key}) : super(key: key);

  @override
  State<RiscoReducao> createState() => _RiscoReducaoState();
}

class _RiscoReducaoState extends State<RiscoReducao> {
  bool clicou = false;
  TextEditingController controllerRAS = TextEditingController();
  TextEditingController controllerCEa = TextEditingController();
  double? rAS = 0, cEa = 0;
  String riscoRed = '';
  riscoReducao() {
    setState(() {
      rAS = double.parse(controllerRAS.text);
      cEa = double.parse(controllerCEa.text);
      if (rAS! >= 0 && rAS! <= 3) {
        if (cEa! > 0.7) {
          riscoRed = 'nenhum';
        } else if (cEa! >= 0.2) {
          riscoRed = 'moderado';
        }
        if (cEa! < 0.2) {
          riscoRed = 'severo';
        }
      }
      if (rAS! > 3 && rAS! <= 6) {
        if (cEa! > 1.2) {
          riscoRed = 'nenhum';
        } else if (cEa! >= 0.3) {
          riscoRed = 'moderado';
        }
        if (cEa! < 0.3) {
          riscoRed = 'severo';
        }
      }
      if (rAS! > 6 && rAS! <= 12) {
        if (cEa! > 1.9) {
          riscoRed = 'nenhum';
        } else if (cEa! >= 0.5) {
          riscoRed = 'moderado';
        }
        if (cEa! < 0.5) {
          riscoRed = 'severo';
        }
      }
      if (rAS! > 12 && rAS! <= 20) {
        if (cEa! > 2.9) {
          riscoRed = 'nenhum';
        } else if (cEa! >= 1.3) {
          riscoRed = 'moderado';
        }
        if (cEa! < 1.3) {
          riscoRed = 'severo';
        }
      }
      if (rAS! > 20 && rAS! <= 40) {
        if (cEa! > 5) {
          riscoRed = 'nenhum';
        } else if (cEa! >= 2.9) {
          riscoRed = 'moderado';
        }
        if (cEa! < 2.9) {
          riscoRed = 'severo';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: Container(
                child: Center(
                  child: Text(
                    "Aqua+",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 6, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.yellow,
            expandedHeight: 170,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/appbar2.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    // ignore: prefer_const_constructors
                    "Insira os valores em mg/L:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: controllerRAS,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(color: Colors.black),
                      labelText: "Insira o valor de RASº",
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: controllerCEa,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(color: Colors.black),
                      labelText: "Insira o valor de CEa",
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.yellow, onPrimary: Colors.black),
                          onPressed: () {
                            riscoReducao();
                            setState(() {
                              clicou = true;
                            });
                          },
                          child: Text('Resultado')),
                    ],
                  ),
                  SizedBox(height: 20),
                  clicou
                      ? Text(
                          'Grau de risco de utilização à redução da infiltração considerando RAS e CEa: $riscoRed',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      : SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
