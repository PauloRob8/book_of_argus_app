import 'package:book_of_argus/cubits/characters/add_characters/add_characters_state.dart';
import 'package:book_of_argus/cubits/characters/add_characters/add_charactes_cubit.dart';
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

  late final FocusNode _nameFocusNode;
  late final FocusNode _raceFocusNode;
  late final FocusNode _aligmentFocusNode;
  late final FocusNode _backgroundFocusNode;
  late final FocusNode _playerNameFocusNode;
  late final FocusNode _xpFocusNode;

  String? _nameErrorText;
  String? _raceErrorText;
  String? _aligmentErrorText;
  String? _backgroundErrorText;
  String? _xpErrorText;
  String? _playerNameErrorText;

  String _selectedClass = 'artífice';
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

    _nameFocusNode = FocusNode();
    _raceFocusNode = FocusNode();
    _aligmentFocusNode = FocusNode();
    _backgroundFocusNode = FocusNode();
    _playerNameFocusNode = FocusNode();
    _xpFocusNode = FocusNode();
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
        const DropdownMenuItem<String>(
          value: 'artífice',
          child: Text(
            'artífice',
            style: TextStyle(
              color: Colors.cyan,
            ),
          ),
        ),
        DropdownMenuItem<String>(
          value: 'bárbaro',
          child: Text(
            'bárbaro',
            style: TextStyle(
              color: Colors.red[900],
            ),
          ),
        ),
        const DropdownMenuItem<String>(
          value: 'bardo',
          child: Text(
            'bardo',
            style: TextStyle(
              color: Colors.purple,
            ),
          ),
        ),
        DropdownMenuItem<String>(
          value: 'bruxo',
          child: Text(
            'bruxo',
            style: TextStyle(
              color: Colors.purple[900],
            ),
          ),
        ),
        const DropdownMenuItem<String>(
          value: 'clérigo',
          child: Text(
            'clérigo',
            style: TextStyle(
              color: Color.fromARGB(255, 185, 168, 18),
            ),
          ),
        ),
        DropdownMenuItem<String>(
          value: 'druida',
          child: Text(
            'druida',
            style: TextStyle(
              color: Colors.green[800],
            ),
          ),
        ),
        DropdownMenuItem<String>(
          value: 'feiticeiro',
          child: Text(
            'feiticeiro',
            style: TextStyle(
              color: Colors.red[600],
            ),
          ),
        ),
        const DropdownMenuItem<String>(
          value: 'guerreiro',
          child: Text(
            'guerreiro',
            style: TextStyle(
              color: Colors.orange,
            ),
          ),
        ),
        const DropdownMenuItem<String>(
          value: 'ladino',
          child: Text(
            'ladino',
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
        DropdownMenuItem<String>(
          value: 'mago',
          child: Text(
            'mago',
            style: TextStyle(
              color: Colors.blue[900],
            ),
          ),
        ),
        const DropdownMenuItem<String>(
          value: 'monge',
          child: Text(
            'monge',
            style: TextStyle(
              color: Colors.brown,
            ),
          ),
        ),
        const DropdownMenuItem<String>(
          value: 'patrulheiro',
          child: Text(
            'patrulheiro',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
        ),
        const DropdownMenuItem<String>(
          value: 'paladino',
          child: Text(
            'paladino',
            style: TextStyle(
              color: Colors.blueAccent,
            ),
          ),
        ),
      ];
}
