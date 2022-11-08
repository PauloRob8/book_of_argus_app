import 'package:flutter/material.dart';

class PlayerInfoPage extends StatefulWidget {
  const PlayerInfoPage({Key? key}) : super(key: key);

  @override
  State<PlayerInfoPage> createState() => _PlayerInfoPageState();
}

class _PlayerInfoPageState extends State<PlayerInfoPage> {
  @override
  Widget build(BuildContext context) => Center(
        child: Text(
          'Caracters Info Page',
        ),
      );
}
