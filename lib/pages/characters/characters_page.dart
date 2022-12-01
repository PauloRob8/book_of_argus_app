import 'package:book_of_argus/cubits/characters/characters.dart';
import 'package:book_of_argus/cubits/login/login.dart';
import 'package:book_of_argus/pages/characters/widgets/character_card_widget.dart';
import 'package:book_of_argus/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({Key? key}) : super(key: key);

  static route() => BlocProvider<CharactersCubit>(
        create: (context) => CharactersCubit()..loadChars(),
        child: const CharactersPage(),
      );

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  LoginCubit get loginCubit => context.read<LoginCubit>();
  CharactersCubit get charsCubit => context.read<CharactersCubit>();

  @override
  Widget build(BuildContext context) => BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.logout) {
            Navigator.of(context).popAndPushNamed(Routes.loginRoute);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.purple,
            title: const Text(
              'PERSONAGENS',
              style: TextStyle(fontFamily: 'MedievalSharp'),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () => loginCubit.logout(),
                icon: const Icon(Icons.logout_outlined),
              ),
            ],
          ),
          body: SafeArea(
            child: BlocBuilder<CharactersCubit, CharactersState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: SpinKitThreeBounce(
                      color: Colors.purple,
                      size: 40,
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.only(bottom: 80.0),
                  child: ListView.builder(
                    itemCount: state.chars.length,
                    itemBuilder: (context, index) => CharacterCardWidget(
                      playerData: state.chars[index],
                    ),
                  ),
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.purple,
            tooltip: 'teste',
            onPressed: () async {
              await Navigator.of(context).pushNamed(Routes.addCharPageRoute);
              charsCubit.loadChars();
            },
            isExtended: true,
            label: Row(
              children: const [
                Text(
                  'ADICIONAR PERSONAGEM',
                  style: TextStyle(fontFamily: 'NanumGothicCoding'),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(FontAwesomeIcons.diceD20),
              ],
            ),
          ),
        ),
      );
}
