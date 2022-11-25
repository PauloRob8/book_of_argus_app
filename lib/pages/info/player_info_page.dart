import 'package:flutter/material.dart';

class PlayerInfoPage extends StatefulWidget {
  const PlayerInfoPage({Key? key}) : super(key: key);

  @override
  State<PlayerInfoPage> createState() => _PlayerInfoPageState();
}

class _PlayerInfoPageState extends State<PlayerInfoPage> {
  @override
  Widget build(BuildContext context) => Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: const Image(
            width: 200,
            height: 200,
            image: NetworkImage(
              'http://1.bp.blogspot.com/-Cojn1I8UAD0/UVpN3MdQtiI/AAAAAAAAAoo/FgULqKrRP9Q/s1600/golias+druida.png',
            ),
          ),
        ),
      );
}
