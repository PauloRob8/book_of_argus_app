import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SpellsPage extends StatefulWidget {
  const SpellsPage({Key? key}) : super(key: key);

  @override
  State<SpellsPage> createState() => _SpellsPageState();
}

class _SpellsPageState extends State<SpellsPage> {
  @override
  Widget build(BuildContext context) => Center(
        child: Text('El Magias'),
      );
}
