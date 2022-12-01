import 'package:book_of_argus/cubits/characters/add_characters/add_characters_state.dart';
import 'package:book_of_argus/cubits/characters/add_characters/add_charactes_cubit.dart';
import 'package:book_of_argus/models/player_data.dart';
import 'package:book_of_argus/widgets/button_medium.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCharPage extends StatefulWidget {
  const AddCharPage({Key? key}) : super(key: key);

  static route() => BlocProvider(
        create: (_) => AddCharactersCubit(),
        child: const AddCharPage(),
      );

  @override
  State<AddCharPage> createState() => _AddCharPageState();
}

class _AddCharPageState extends State<AddCharPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _raceController;
  late final TextEditingController _aligmentController;
  late final TextEditingController _backgroundController;
  late final TextEditingController _playerNameController;
  late final TextEditingController _xpController;
  late final TextEditingController _lvlController;

  late final FocusNode _nameFocusNode;
  late final FocusNode _raceFocusNode;
  late final FocusNode _aligmentFocusNode;
  late final FocusNode _backgroundFocusNode;
  late final FocusNode _playerNameFocusNode;
  late final FocusNode _xpFocusNode;
  late final FocusNode _lvlFocusNode;

  String? _nameErrorText;
  String? _raceErrorText;
  String? _aligmentErrorText;
  String? _backgroundErrorText;
  String? _xpErrorText;
  String? _lvlErrorText;
  String? _playerNameErrorText;

  String _selectedClass = PlayerData.warrior;
  final _defaultFieldErrorText = 'O campo ta vazio doidão!';

  AddCharactersCubit get cubit => context.read<AddCharactersCubit>();

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();
    _raceController = TextEditingController();
    _aligmentController = TextEditingController();
    _backgroundController = TextEditingController();
    _playerNameController = TextEditingController();
    _xpController = TextEditingController();
    _lvlController = TextEditingController();

    _nameFocusNode = FocusNode();
    _raceFocusNode = FocusNode();
    _aligmentFocusNode = FocusNode();
    _backgroundFocusNode = FocusNode();
    _playerNameFocusNode = FocusNode();
    _xpFocusNode = FocusNode();
    _lvlFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'ADICIONE SEU PERSONAGEM',
            style: TextStyle(
              fontFamily: 'MedievalSharp',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        body: BlocConsumer<AddCharactersCubit, AddCharactersState>(
          listener: (context, state) {
            if (state.added) {
              Navigator.of(context).pop();
            }
          },
          builder: _builder,
        ),
      );

  void _makeErrorTexts(AddCharactersState state) {
    if (state.errorsType.contains(AddCharactersError.emptyName)) {
      _nameErrorText = _defaultFieldErrorText;
    } else {
      _nameErrorText = null;
    }
    if (state.errorsType.contains(AddCharactersError.emptyRace)) {
      _raceErrorText = _defaultFieldErrorText;
    } else {
      _raceErrorText = null;
    }
    if (state.errorsType.contains(AddCharactersError.emptyAligment)) {
      _aligmentErrorText = _defaultFieldErrorText;
    } else {
      _aligmentErrorText = null;
    }
    if (state.errorsType.contains(AddCharactersError.emptyBackground)) {
      _backgroundErrorText = _defaultFieldErrorText;
    } else {
      _backgroundErrorText = null;
    }
    if (state.errorsType.contains(AddCharactersError.emptyXP)) {
      _xpErrorText = _defaultFieldErrorText;
    } else {
      _xpErrorText = null;
    }
    if (state.errorsType.contains(AddCharactersError.emptyLvl)) {
      _lvlErrorText = _defaultFieldErrorText;
    } else {
      _lvlErrorText = null;
    }
    if (state.errorsType.contains(AddCharactersError.emptyPlayerName)) {
      _playerNameErrorText = _defaultFieldErrorText;
    } else {
      _playerNameErrorText = null;
    }
  }

  Widget _builder(BuildContext context, AddCharactersState state) {
    _makeErrorTexts(state);
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0,
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _formFields(),
              ButtonMedium(
                width: 120,
                text: 'ADICIONAR',
                isLoading: state.isLoading,
                onTap: () => cubit.verifyFields(
                  name: _nameController.text,
                  race: _raceController.text,
                  charClass: _selectedClass,
                  aligment: _aligmentController.text,
                  background: _backgroundController.text,
                  xp: _xpController.text,
                  lvl: _lvlController.text,
                  playerName: _playerNameController.text,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formFields() => Card(
        color: Colors.amber[50],
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1.5,
            color: Colors.purple,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                focusNode: _nameFocusNode,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  label: const Text(
                    'Nome do personagem',
                    style: TextStyle(
                      fontFamily: 'NanumGothicCoding',
                    ),
                  ),
                  errorText: _nameErrorText,
                ),
              ),
              TextFormField(
                controller: _raceController,
                focusNode: _raceFocusNode,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  label: const Text(
                    'Raça do personagem',
                    style: TextStyle(
                      fontFamily: 'NanumGothicCoding',
                    ),
                  ),
                  errorText: _raceErrorText,
                ),
              ),
              _selectClassCard(),
              TextFormField(
                controller: _aligmentController,
                focusNode: _aligmentFocusNode,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  label: const Text(
                    'Alinhamento (leal, caótico etc)',
                    style: TextStyle(
                      fontFamily: 'NanumGothicCoding',
                    ),
                  ),
                  errorText: _aligmentErrorText,
                ),
              ),
              TextFormField(
                controller: _backgroundController,
                focusNode: _backgroundFocusNode,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  label: const Text(
                    'Antecedente',
                    style: TextStyle(
                      fontFamily: 'NanumGothicCoding',
                    ),
                  ),
                  errorText: _backgroundErrorText,
                ),
              ),
              TextFormField(
                controller: _xpController,
                focusNode: _xpFocusNode,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: const Text(
                    'Pontos de experiência (XP)',
                    style: TextStyle(
                      fontFamily: 'NanumGothicCoding',
                    ),
                  ),
                  errorText: _xpErrorText,
                ),
              ),
              TextFormField(
                controller: _lvlController,
                focusNode: _lvlFocusNode,
                keyboardType: TextInputType.number,
                maxLength: 2,
                decoration: InputDecoration(
                  label: const Text(
                    'level',
                    style: TextStyle(
                      fontFamily: 'NanumGothicCoding',
                    ),
                  ),
                  counterText: '',
                  errorText: _lvlErrorText,
                ),
              ),
              TextFormField(
                controller: _playerNameController,
                focusNode: _playerNameFocusNode,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  label: const Text(
                    'Nome do jogador',
                    style: TextStyle(
                      fontFamily: 'NanumGothicCoding',
                    ),
                  ),
                  errorText: _playerNameErrorText,
                ),
              ),
            ],
          ),
        ),
      );

  Card _selectClassCard() => Card(
        color: Colors.amber[50],
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 5.0,
          ),
          child: Row(
            children: [
              const Text(
                'Classe',
                style: TextStyle(
                  fontFamily: 'MedievalSharp',
                  fontSize: 18,
                ),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: DropdownButton<String>(
                  underline: const SizedBox(),
                  dropdownColor: Colors.amber[50],
                  style: const TextStyle(
                    fontFamily: 'MedievalSharp',
                    fontSize: 18,
                    color: Colors.cyan,
                  ),
                  value: _selectedClass,
                  items: _makeClasses(),
                  onChanged: (value) {
                    setState(() {
                      _selectedClass = value as String;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      );

  List<DropdownMenuItem<String>> _makeClasses() => [
        DropdownMenuItem<String>(
          value: PlayerData.artificer,
          child: Text(
            PlayerData.artificer,
            style: const TextStyle(
              color: Colors.cyan,
            ),
          ),
        ),
        DropdownMenuItem<String>(
          value: PlayerData.barbarian,
          child: Text(
            PlayerData.barbarian,
            style: TextStyle(
              color: Colors.red[900],
            ),
          ),
        ),
        DropdownMenuItem<String>(
          value: PlayerData.bard,
          child: Text(
            PlayerData.bard,
            style: const TextStyle(
              color: Colors.purple,
            ),
          ),
        ),
        DropdownMenuItem<String>(
          value: PlayerData.warlock,
          child: Text(
            PlayerData.warlock,
            style: TextStyle(
              color: Colors.purple[900],
            ),
          ),
        ),
        DropdownMenuItem<String>(
          value: PlayerData.cleric,
          child: Text(
            PlayerData.cleric,
            style: const TextStyle(
              color: Color.fromARGB(255, 185, 168, 18),
            ),
          ),
        ),
        DropdownMenuItem<String>(
          value: PlayerData.druid,
          child: Text(
            PlayerData.druid,
            style: TextStyle(
              color: Colors.green[800],
            ),
          ),
        ),
        DropdownMenuItem<String>(
          value: PlayerData.sorcerer,
          child: Text(
            PlayerData.sorcerer,
            style: TextStyle(
              color: Colors.red[600],
            ),
          ),
        ),
        DropdownMenuItem<String>(
          value: PlayerData.warrior,
          child: Text(
            PlayerData.warrior,
            style: const TextStyle(
              color: Colors.orange,
            ),
          ),
        ),
        DropdownMenuItem<String>(
          value: PlayerData.rogue,
          child: Text(
            PlayerData.rogue,
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
        DropdownMenuItem<String>(
          value: PlayerData.mage,
          child: Text(
            PlayerData.mage,
            style: TextStyle(
              color: Colors.blue[900],
            ),
          ),
        ),
        DropdownMenuItem<String>(
          value: PlayerData.monk,
          child: Text(
            PlayerData.monk,
            style: const TextStyle(
              color: Colors.brown,
            ),
          ),
        ),
        DropdownMenuItem<String>(
          value: PlayerData.ranger,
          child: Text(
            PlayerData.ranger,
            style: const TextStyle(
              color: Colors.green,
            ),
          ),
        ),
        DropdownMenuItem<String>(
          value: PlayerData.paladin,
          child: Text(
            PlayerData.paladin,
            style: const TextStyle(
              color: Colors.blueAccent,
            ),
          ),
        ),
      ];
}
