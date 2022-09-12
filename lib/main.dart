import 'package:flutter/material.dart';
import 'package:aquaplus/slivergrid.dart';

main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AquaPlus(),
  ));
}

class AquaPlus extends StatefulWidget {
  const AquaPlus({Key? key}) : super(key: key);

  @override
  State<AquaPlus> createState() => AquaPlusState();
}

class AquaPlusState extends State<AquaPlus> {
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
                child: GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  children: [
                    const GridCustomizado('TSD', 'Cálculo do TSD', 1),
                    const GridCustomizado('GHF', 'Cálculo do GHF', 2),
                    const GridCustomizado('RAS', 'Cálculo do RAS', 3),
                    const GridCustomizado('Grau de Risco',
                        'Risco de utilização quanto à salinidade', 4),
                    const GridCustomizado(
                        'Grau de Risco',
                        'Risco de utilização à redução da infiltração considerando RAS e CEa',
                        5),
                    const GridCustomizado(
                        'Grau de Risco',
                        'Risco de utilização quanto à toxicidade de íons específicos e pH',
                        6),
                    const GridCustomizado(
                        'Classificação',
                        'Classificação da água de irrigação segundo o grau de dureza',
                        7),
                    const GridCustomizado(
                        'Classificação',
                        'Classificação da salinidade e sodicidade segundo Richards',
                        8),
                    const GridCustomizado('Material',
                        'Textos informativos sobre qualidade da água', 8)
                  ],
                )
                /*Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Velit egestas dui id ornare arcu. Sapien faucibus et molestie ac feugiat sed lectus. Egestas fringilla phasellus faucibus scelerisque eleifend donec pretium. Cras tincidunt lobortis feugiat vivamus at augue eget. Gravida neque convallis a cras semper auctor neque. Ut sem viverra aliquet eget sit amet tellus cras adipiscing. Viverra accumsan in nisl nisi scelerisque eu ultrices vitae. Rhoncus urna neque viverra justo nec ultrices dui sapien eget. Senectus et netus et malesuada fames. Phasellus faucibus scelerisque eleifend donec pretium. Morbi tincidunt augue interdum velit euismod in pellentesque massa placerat.it amet consectetur adipiscing elit. Fusce ut placerat orci nulla pellentesque dignissim enim sit. Leo vel orci porta non pulvinar neque laoreet suspendisse. Tristique senectus et netus et malesuada fames. Pharetra sit amet aliquam id diam maecenas ultricies mi eget. Tellus pellentesque eu tincidunt tortor. Scelerisque felis imperdiet proin fermentum leo. Id venenatis a condimentum vitae sapien pellentesque habitant morbi. Elit ullamcorper dignissim cras tincidunt lobortis feugiat vivamus at. Sed adipiscing diam donec adipiscing. Nulla malesuada pellentesque elit eget gravida. Fermentum odio eu feugiat pretium nibh ipsum consequat nisl vel. Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Facilisis gravida neque convallis a cras semper auctor.Elementum nisi quis eleifend quam adipiscing vitae. Cursus turpis massa tincidunt dui ut ornare. Consectetur purus ut faucibus pulvinar elementum integer. Orci phasellus egestas tellus rutrum tellus pellentesque eu. Nisl pretium fusce id velit ut tortor pretium viverra suspendisse. Diam volutpat commodo sed egestas. Ultrices vitae auctor eu augue ut lectus. Velit ut tortor pretium viverra suspendisse. Quam quisque id diam vel quam. Ac feugiat sed lectus vestibulum. Venenatis urna cursus eget nunc scelerisque viverra mauris in aliquam. Posuere ac ut consequat semper viverra nam libero. Enim sit amet venenatis urna cursus eget nunc scelerisque. Amet tellus cras adipiscing enim eu turpis egestas pretium.Sed pulvinar proin gravida hendrerit lectus a. Et ultrices neque ornare aenean euismod elementum. Enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac. Tellus molestie nunc non blandit massa enim nec. Nisi est sit amet facilisis magna etiam tempor. Faucibus purus in massa tempor nec feugiat nisl pretium fusce. Placerat vestibulum lectus mauris ultrices eros. Hac habitasse platea dictumst quisque sagittis purus sit amet volutpat. Augue interdum velit euismod in. Odio ut enim blandit volutpat maecenas volutpat blandit aliquam. Pretium nibh ipsum consequat nisl vel pretium lectus. Lectus quam id leo in vitae turpis massa. Sed augue lacus viverra vitae congue eu. Donec et odio pellentesque diam volutpat commodo sed.Eget dolor morbi non arcu risus quis varius. Pellentesque elit eget gravida cum. Molestie a iaculis at erat. Amet risus nullam eget felis eget nunc lobortis mattis aliquam. Eget mauris pharetra et ultrices neque ornare. Nibh tortor id aliquet lectus proin. Risus viverra adipiscing at in tellus integer feugiat scelerisque varius. Non diam phasellus vestibulum lorem sed risus ultricies. Etiam non quam lacus suspendisse. Sapien nec sagittis aliquam malesuada bibendum arcu. Risus feugiat in ante metus dictum at tempor. Ridiculus mus mauris vitae ultricies leo integer malesuada. Id diam vel quam elementum pulvinar etiam non quam lacus. Enim sit amet venenatis urna cursus eget nunc scelerisque. Mi sit amet mauris commodo. Interdum velit euismod in pellentesque massa placerat. Volutpat blandit aliquam etiam erat."),
            */
                ),
          ),
        ],
      ),
    );
  }
}
