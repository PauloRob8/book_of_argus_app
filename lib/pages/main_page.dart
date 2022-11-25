import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'info/player_info_page.dart';
import 'items/items_page.dart';
import 'spells/spells_page.dart';
import 'status/player_status_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
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
