import 'package:flutter/material.dart';
import 'dart:math';

class ClassRichards extends StatefulWidget {
  const ClassRichards({Key? key}) : super(key: key);

  @override
  State<ClassRichards> createState() => _ClassRichardsState();
}

class _ClassRichardsState extends State<ClassRichards> {
  bool clicou = false;
  TextEditingController controllerRAS = TextEditingController();
  TextEditingController controllerCEa = TextEditingController();
  double? rAS = 0, cEa = 0;
  String classCE = '';
  classCEa() {
    setState(() {
      cEa = double.parse(controllerCEa.text);
      cEa = cEa! * 1000;
      if (cEa! >= 0 && cEa! < 250) {
        classCE = 'C1';
      }
      if (cEa! >= 250 && cEa! < 750) {
        classCE = 'C2';
      }
      if (cEa! >= 750 && cEa! < 2250) {
        classCE = 'C3';
      }
      if (cEa! >= 2250 && cEa! < 5000) {
        classCE = 'C4';
      }
    });
  }

  String classRAS = '';
  double? logCEa, s1, s2, s3;
  classRAs() {
    setState(() {
      rAS = double.parse(controllerRAS.text);
      logCEa = log(cEa!);
      s1 = 18.87 - 4.44 * logCEa!;
      s2 = 31.31 - 6.66 * logCEa!;
      s3 = 43.75 - 8.87 * logCEa!;
      if (rAS! <= s1!) {
        classRAS = 'S1';
      }
      if (s1! < rAS! && rAS! <= s2!) {
        classRAS = 'S2';
      }
      if (s2! < rAS! && rAS! <= s3!) {
        classRAS = 'S3';
      }
      if (rAS! > s3!) {
        classRAS = 'S4';
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
                            classCEa();
                            classRAs();
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
                          'Classificação da salinidade e sodicidade segundo Richards: $classCE$classRAS',
                          style: const TextStyle(
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
