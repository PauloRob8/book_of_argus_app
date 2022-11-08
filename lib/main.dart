import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portao_da_besta_rpg/pages/info/player_info_page.dart';
import 'package:portao_da_besta_rpg/pages/items/items_page.dart';
import 'package:portao_da_besta_rpg/pages/spells/spells_page.dart';
import 'package:portao_da_besta_rpg/pages/status/player_status_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Portão da Besta'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: const Text(
            'Rokhan Loktharon',
            style: TextStyle(
              fontFamily: 'MedievalSharp',
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelStyle: TextStyle(
              fontFamily: 'MedievalSharp',
            ),
            tabs: [
              Tab(
                icon: Icon(FontAwesomeIcons.diceD20),
                text: 'Status',
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.scroll),
                text: 'Magias',
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.dungeon),
                text: 'Items',
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.dAndD),
                text: 'Info',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            PlayerStatusPage(),
            SpellsPage(),
            ItemsPage(),
            PlayerInfoPage(),
          ],
        ),
      ),
    );
  }
}
