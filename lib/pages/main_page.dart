import 'package:book_of_argus/cubits/login/login.dart';
import 'package:book_of_argus/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  LoginCubit get cubit => context.read<LoginCubit>();

  @override
  Widget build(BuildContext context) => BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.logout) {
            Navigator.of(context).popAndPushNamed(Routes.loginRoute);
          }
        },
        child: DefaultTabController(
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
              automaticallyImplyLeading: false,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: GestureDetector(
                    onTap: () {
                      cubit.logout();
                    },
                    child: const Icon(Icons.logout_rounded),
                  ),
                ),
              ],
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
        ),
      );
}
