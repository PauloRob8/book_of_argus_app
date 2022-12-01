import 'package:book_of_argus/models/player_data.dart';
import 'package:book_of_argus/routes/routes.dart';
import 'package:book_of_argus/routes/screen_arguments.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CharacterCardWidget extends StatelessWidget {
  const CharacterCardWidget({
    required this.playerData,
    Key? key,
  }) : super(key: key);

  final PlayerData playerData;

  @override
  Widget build(BuildContext context) {
    const avatarRadius = 40.0;
    const iconSize = 30.0;
    return GestureDetector(
      onTap: () async {
        await Navigator.of(context).pushNamed(
          Routes.mainPageRoute,
          arguments: ScreenArguments(
            chardId: playerData.id,
            playerName: playerData.name,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Card(
                color: Colors.teal[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 60, bottom: 10.0, top: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              playerData.name,
                              style: const TextStyle(
                                fontFamily: 'NanumGothicCoding',
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              '${playerData.charClass} lvl: ${playerData.lvl}',
                              style: const TextStyle(
                                fontFamily: 'NanumGothicCoding',
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              playerData.aligment,
                              style: const TextStyle(
                                fontFamily: 'NanumGothicCoding',
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              playerData.background,
                              style: const TextStyle(
                                fontFamily: 'NanumGothicCoding',
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: Icon(
                          FontAwesomeIcons.skull,
                          size: 26,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
                left: 6,
              ),
              child: _getAvatarIcon(
                playerData.charClass,
                avatarRadius,
                iconSize,
              ),
            ),
          ],
        ),
      ),
    );
  }

  CircleAvatar _getAvatarIcon(
    String charClass,
    double avatarRadius,
    double iconSize,
  ) {
    switch (charClass) {
      case 'artífice':
        return CircleAvatar(
          radius: avatarRadius,
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white,
          child: Icon(
            FontAwesomeIcons.mortarPestle,
            size: iconSize,
          ),
        );

      case 'bárbaro':
        return CircleAvatar(
          radius: avatarRadius,
          backgroundColor: Colors.red[900],
          foregroundColor: Colors.white,
          child: Icon(
            FontAwesomeIcons.fire,
            size: iconSize,
          ),
        );

      case 'bardo':
        return CircleAvatar(
          radius: avatarRadius,
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          child: Icon(
            FontAwesomeIcons.guitar,
            size: iconSize,
          ),
        );

      case 'bruxo':
        return CircleAvatar(
          radius: avatarRadius,
          backgroundColor: Colors.purple[900],
          foregroundColor: Colors.white,
          child: Icon(
            FontAwesomeIcons.meteor,
            size: iconSize,
          ),
        );

      case 'clérigo':
        return CircleAvatar(
          radius: avatarRadius,
          backgroundColor: const Color.fromARGB(255, 185, 168, 18),
          foregroundColor: Colors.white,
          child: Icon(
            FontAwesomeIcons.bookBible,
            size: iconSize,
          ),
        );

      case 'druida':
        return CircleAvatar(
          radius: avatarRadius,
          backgroundColor: Colors.green[800],
          foregroundColor: Colors.white,
          child: Icon(
            FontAwesomeIcons.paw,
            size: iconSize,
          ),
        );

      case 'feiticeiro':
        return CircleAvatar(
          radius: avatarRadius,
          backgroundColor: Colors.red[600],
          foregroundColor: Colors.white,
          child: Icon(
            FontAwesomeIcons.wandSparkles,
            size: iconSize,
          ),
        );

      case 'guerreiro':
        return CircleAvatar(
          radius: avatarRadius,
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          child: Icon(
            FontAwesomeIcons.shield,
            size: iconSize,
          ),
        );

      case 'ladino':
        return CircleAvatar(
          radius: avatarRadius,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          child: Icon(
            FontAwesomeIcons.skullCrossbones,
            size: iconSize,
          ),
        );

      case 'mago':
        return CircleAvatar(
          radius: avatarRadius,
          backgroundColor: Colors.blue[900],
          foregroundColor: Colors.white,
          child: Icon(
            FontAwesomeIcons.hatWizard,
            size: iconSize,
          ),
        );

      case 'monge':
        return CircleAvatar(
          radius: avatarRadius,
          backgroundColor: Colors.brown,
          foregroundColor: Colors.white,
          child: Icon(
            FontAwesomeIcons.handFist,
            size: iconSize,
          ),
        );

      case 'patrulheiro':
        return CircleAvatar(
          radius: avatarRadius,
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          child: Icon(
            FontAwesomeIcons.featherPointed,
            size: iconSize,
          ),
        );

      case 'paladino':
        return CircleAvatar(
          radius: avatarRadius,
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          child: Icon(
            FontAwesomeIcons.handsBound,
            size: iconSize,
          ),
        );

      default:
        return CircleAvatar(
          radius: avatarRadius,
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          child: Icon(
            FontAwesomeIcons.tree,
            size: iconSize,
          ),
        );
    }
  }
}
