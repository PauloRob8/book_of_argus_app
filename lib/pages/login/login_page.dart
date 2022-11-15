import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();

    _loginController = TextEditingController();
    _passwordController = TextEditingController();

    _loginFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.white,
        child: SafeArea(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextFormField(
                    controller: _loginController,
                    focusNode: _loginFocusNode,
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
                    ),
                    keyboardType: TextInputType.emailAddress,
                    maxLength: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextFormField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.0,
                          color: Colors.purple,
                        ),
                      ),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.remove_red_eye_rounded,
                        color: Colors.purple,
                      ),
                      hintText: 'youshallnotaccess',
                      hintStyle: TextStyle(
                        fontFamily: 'NanumGothicCoding',
                      ),
                    ),
                    obscureText: true,
                    keyboardType: TextInputType.name,
                    maxLength: 50,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: 240,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.purple,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'LOGAR',
                        style: TextStyle(
                          fontFamily: 'MedievalSharp',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();

    _loginFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}
