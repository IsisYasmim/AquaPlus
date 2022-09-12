import 'package:flutter/material.dart';
import 'dart:math';

class CalcRAS extends StatefulWidget {
  const CalcRAS({Key? key}) : super(key: key);

  @override
  State<CalcRAS> createState() => _CalcRAState();
}

class _CalcRAState extends State<CalcRAS> {
  bool clicou = false;
  TextEditingController controllerNa = TextEditingController();
  TextEditingController controllerMg = TextEditingController();
  TextEditingController controllerCa = TextEditingController();
  double? rAS = 0, na = 0, ca = 0, mg = 0, raiz = 0;
  calculoRAS() {
    setState(() {
      na = double.parse(controllerNa.text);
      na = na! * 0.0435;
      mg = double.parse(controllerMg.text);
      mg = mg! * 0.0833;
      ca = double.parse(controllerCa.text);
      ca = ca! * 0.05;
      raiz = (ca! + mg!) / 2;
      rAS = na! / sqrt(raiz!);
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
            expandedHeight: 160,
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
                    controller: controllerCa,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(color: Colors.black),
                      labelText: "Insira o valor de Ca\u207A\u207A",
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
                    controller: controllerMg,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(color: Colors.black),
                      labelText: "Insira o valor de Mg\u207A\u207A",
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
                    controller: controllerNa,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(color: Colors.black),
                      labelText: "Insira o valor de Na\u207A",
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
                            calculoRAS();
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
                          'Valor de GHF: $rAS',
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
