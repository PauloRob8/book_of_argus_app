import 'package:book_of_argus/cubits/login/login.dart';
import 'package:book_of_argus/firebase_options.dart';
import 'package:book_of_argus/pages/login/login_page.dart';
import 'package:book_of_argus/routes/routes.dart';
import 'package:book_of_argus/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final preferences = await SharedPreferences.getInstance();
  runApp(MyApp(preferences: preferences));
}

class MyApp extends StatelessWidget {
  const MyApp({
    required this.preferences,
    Key? key,
  }) : super(key: key);

  final SharedPreferences preferences;

  @override
  Widget build(BuildContext context) {
    final user = AuthService.getCurrentUser();
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (_) => LoginCubit(
            preferences: preferences,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute:
            user != null ? Routes.charactersPageRoute : Routes.loginRoute,
        routes: Routes.allMapped,
        debugShowCheckedModeBanner: false,
        home: const LoginPage(),
      ),
    );
  }
}
