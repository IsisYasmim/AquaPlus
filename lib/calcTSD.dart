import 'package:flutter/material.dart';

class CalcTSD extends StatefulWidget {
  const CalcTSD({Key? key}) : super(key: key);

  @override
  State<CalcTSD> createState() => _CalcTSDState();
}

class _CalcTSDState extends State<CalcTSD> {
  bool clicou = false;
  TextEditingController controllerCEa = TextEditingController();
  double? tSD = 0, cEa = 0;
  calculoTSD() {
    setState(() {
      cEa = double.parse(controllerCEa.text);
      tSD = 640 * cEa!;
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
                            calculoTSD();
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
                          'Valor de TSD: $tSD',
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
