import 'package:flutter/material.dart';

class PlayerStatusPage extends StatefulWidget {
  const PlayerStatusPage({Key? key}) : super(key: key);

  @override
  State<PlayerStatusPage> createState() => _PlayerStatusPageState();
}

class _PlayerStatusPageState extends State<PlayerStatusPage> {
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image(
                width: 200,
                height: 200,
                image: NetworkImage(
                  'http://1.bp.blogspot.com/-Cojn1I8UAD0/UVpN3MdQtiI/AAAAAAAAAoo/FgULqKrRP9Q/s1600/golias+druida.png',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 15.0,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _makeRowText('Druida lvl 9', bold: true),
                          _makeRowText('Eremita', bold: true),
                          _makeRowText('Paulera', bold: true),
                        ],
                      ),
                      Divider(
                        color: Colors.grey[850],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _makeRowText('CLASSE E NIVEL', bold: false),
                          _makeRowText('ANTECEDENTE', bold: false),
                          _makeRowText('NOME JOGADOR', bold: false),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _makeRowText('Golias', bold: true),
                          _makeRowText('Leal/neutro', bold: true),
                          _makeRowText('54000/68000', bold: true),
                        ],
                      ),
                      Divider(
                        color: Colors.grey[850],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _makeRowText('RAÇA', bold: false),
                          _makeRowText('ALINHAMENTO', bold: false),
                          _makeRowText('XP', bold: false),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              'ATRIBUTOS',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'MedievalSharp',
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            _makeStatusCards(),
          ],
        ),
      );

  Flexible _makeRowText(
    String text, {
    required bool bold,
  }) =>
      Flexible(
        child: Text(
          text,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: 'NanumGothicCoding',
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            fontSize: bold ? 14 : 12,
          ),
        ),
      );

  Widget _makeStatusCards() => Wrap(
        children: [
          SizedBox(
            width: 120,
            height: 160,
            child: Card(
              child: Text('Força'),
            ),
          ),
          SizedBox(
            width: 120,
            height: 160,
            child: Card(
              child: Text('Força'),
            ),
          ),
          SizedBox(
            width: 120,
            height: 160,
            child: Card(
              child: Text('Força'),
            ),
          ),
          SizedBox(
            width: 120,
            height: 160,
            child: Card(
              child: Text('Força'),
            ),
          ),
          SizedBox(
            width: 120,
            height: 160,
            child: Card(
              child: Text('Força'),
            ),
          ),
          SizedBox(
            width: 120,
            height: 160,
            child: Card(
              child: Text('Força'),
            ),
          ),
        ],
      );
}
