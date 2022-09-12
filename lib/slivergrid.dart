import 'package:aquaplus/calcRAS.dart';
import 'package:aquaplus/calcTSD.dart';
import 'package:aquaplus/classDureza.dart';
import 'package:aquaplus/classRichards.dart';
import 'package:aquaplus/riscoReducao.dart';
import 'package:aquaplus/riscoToxicidade.dart';
import 'package:flutter/material.dart';
import 'calcGHF.dart';
import 'riscoSalinidade.dart';

class GridCustomizado extends StatelessWidget {
  final String titulo, subtitulo;
  final int index;
  const GridCustomizado(this.titulo, this.subtitulo, this.index, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return CalcTSD();
              },
            ),
          );
        }
        if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return CalcGHF();
              },
            ),
          );
        }
        if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return CalcRAS();
              },
            ),
          );
        }
        if (index == 4) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return RiscoSalinidade();
              },
            ),
          );
        }
        if (index == 5) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return RiscoReducao();
              },
            ),
          );
        }
        if (index == 6) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return RiscoToxicidade();
              },
            ),
          );
        }
        if (index == 7) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return ClassDureza();
              },
            ),
          );
        }
        if (index == 8) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return ClassRichards();
              },
            ),
          );
        }
      },
      child: Ink(
        height: 20,
        width: 20,
        color: Colors.black,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [Colors.yellow, Colors.yellowAccent])),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "$titulo",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "$subtitulo",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
