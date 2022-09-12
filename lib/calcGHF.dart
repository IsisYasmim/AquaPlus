import 'package:flutter/material.dart';

class CalcGHF extends StatefulWidget {
  const CalcGHF({Key? key}) : super(key: key);

  @override
  State<CalcGHF> createState() => _CalcGHFState();
}

class _CalcGHFState extends State<CalcGHF> {
  bool clicou = false;
  TextEditingController controllerMg = TextEditingController();
  TextEditingController controllerCa = TextEditingController();
  double? gHF = 0, ca = 0, mg = 0;
  calculoGHF() {
    setState(() {
      mg = double.parse(controllerMg.text);
      ca = double.parse(controllerCa.text);
      gHF = ((2.5 * ca!) + (4.12 * mg!)) / 10;
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
              preferredSize: const Size.fromHeight(0),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 6, bottom: 10),
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
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    // ignore: prefer_const_constructors
                    "Insira os valores em mg/L:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: controllerCa,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      floatingLabelStyle: const TextStyle(color: Colors.black),
                      labelText: "Insira o valor de Ca\u207A\u207A",
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: controllerMg,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      floatingLabelStyle: const TextStyle(color: Colors.black),
                      labelText: "Insira o valor de Mg\u207A\u207A",
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.yellow, onPrimary: Colors.black),
                          onPressed: () {
                            calculoGHF();
                            setState(() {
                              clicou = true;
                            });
                          },
                          child: const Text('Resultado')),
                    ],
                  ),
                  const SizedBox(height: 20),
                  clicou
                      ? Text(
                          'Valor de GHF: $gHF',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      : const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
