import 'package:flutter/material.dart';

class RiscoSalinidade extends StatefulWidget {
  const RiscoSalinidade({Key? key}) : super(key: key);

  @override
  State<RiscoSalinidade> createState() => _RiscoSalinidadeState();
}

class _RiscoSalinidadeState extends State<RiscoSalinidade> {
  bool clicou = false;
  TextEditingController controllerTSD = TextEditingController();
  String riscoSal = '';
  double? tSD = 0;
  riscoSalinidade() {
    setState(() {
      tSD = double.parse(controllerTSD.text);
      if (tSD! < 450) {
        riscoSal = 'nenhum';
      } else if (tSD! <= 2000) {
        riscoSal = 'moderado';
      }
      if (tSD! > 2000) {
        riscoSal = 'severo';
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
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 6, bottom: 10),
                decoration: const BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: const Center(
                  child: Text(
                    "Aqua+",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  const Text(
                    // ignore: prefer_const_constructors
                    "Insira o valor em mg/L:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: controllerTSD,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(color: Colors.black),
                      labelText: "Insira o valor de TSD",
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
                            riscoSalinidade();
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
                          'Grau de risco de utilização quanto à salinidade: $riscoSal',
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
