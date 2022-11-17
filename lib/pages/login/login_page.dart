import 'package:book_of_argus/cubits/login/login.dart';
import 'package:book_of_argus/routes/routes.dart';
import 'package:book_of_argus/widgets/button_medium.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _loginController;
  late final TextEditingController _passwordController;

  late final FocusNode _loginFocusNode;
  late final FocusNode _passwordFocusNode;

  String? _emailErrorText;
  String? _passwordErrorText;
  bool obscuredPassword = true;

  LoginCubit get cubit => context.read<LoginCubit>();

  @override
  void initState() {
    super.initState();

    _loginController = TextEditingController();
    _passwordController = TextEditingController();

    _loginFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<LoginCubit, LoginState>(
        listener: _listener,
        builder: _builder,
      );

  void _listener(BuildContext context, LoginState state) {
    if (state.userdId.isNotEmpty) {
      Navigator.of(context).pushNamed(Routes.mainPageRoute);
    } else if (state.errorType == LoginError.invalidEmail) {
      ScaffoldMessenger.of(context)
          .showSnackBar(_snackBar('O email informado não está cadastrado!'));
    } else if (state.errorType == LoginError.invalidPassword) {
      ScaffoldMessenger.of(context).showSnackBar(_snackBar('Senha incorreta!'));
    } else if (state.errorType == LoginError.userNotFound) {
      ScaffoldMessenger.of(context).showSnackBar(
        _snackBar('O login informado não está cadastrado!'),
      );
    }
  }

  Widget _builder(BuildContext context, LoginState state) {
    _makeErrorTexts(state);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 120),
              const Icon(
                FontAwesomeIcons.diceD20,
                size: 46.0,
                color: Colors.purple,
              ),
              const SizedBox(height: 20),
              const Text(
                'Book Of Argus',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26.0,
                  fontFamily: 'MedievalSharp',
                  color: Colors.purple,
                ),
              ),
              const SizedBox(height: 15),
              _makeEmailTextField(),
              _makePasswordTextField(),
              const SizedBox(height: 15),
              ButtonMedium(
                width: 240,
                text: 'LOGAR',
                isLoading: state.isLoading,
                onTap: () => cubit.valiadeUserCredentials(
                  email: _loginController.text,
                  password: _passwordController.text,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _makeErrorTexts(LoginState state) {
    if (state.errorType == LoginError.emptyEmail) {
      _emailErrorText = 'Ops! Você esqueceu de inserir o login meu parsero';
    } else {
      _emailErrorText = null;
    }

    if (state.errorType == LoginError.emptyPassword) {
      _passwordErrorText = 'Ops! Você esqueceu de inserir a senha patrão';
    } else {
      _passwordErrorText = null;
    }
  }

  Padding _makeEmailTextField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: TextFormField(
          controller: _loginController,
          focusNode: _loginFocusNode,
          cursorColor: Colors.purple,
          decoration: InputDecoration(
            fillColor: Colors.purple[700],
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 2.0,
                color: Colors.purple,
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 2.0,
              ),
            ),
            hintText: 'Gandalfu',
            hintStyle: const TextStyle(
              fontFamily: 'NanumGothicCoding',
            ),
            errorText: _emailErrorText,
          ),
          keyboardType: TextInputType.emailAddress,
          maxLength: 30,
        ),
      );

  Padding _makePasswordTextField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: TextFormField(
          controller: _passwordController,
          focusNode: _passwordFocusNode,
          cursorColor: Colors.purple,
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 2.0,
                color: Colors.purple,
              ),
            ),
            border: const OutlineInputBorder(),
            suffixIcon: GestureDetector(
              onTap: () => setState(() {
                obscuredPassword = !obscuredPassword;
              }),
              child: Icon(
                obscuredPassword
                    ? Icons.remove_red_eye_rounded
                    : Icons.remove_red_eye_outlined,
                color: Colors.purple,
              ),
            ),
            hintText: 'youshallnotaccess',
            hintStyle: const TextStyle(
              fontFamily: 'NanumGothicCoding',
            ),
            errorText: _passwordErrorText,
          ),
          obscureText: obscuredPassword,
          keyboardType: TextInputType.name,
          maxLength: 30,
        ),
      );

  SnackBar _snackBar(String message) {
    return SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      elevation: 2.0,
    );
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();

    _loginFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}
