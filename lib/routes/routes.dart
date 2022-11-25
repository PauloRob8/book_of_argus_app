import 'package:book_of_argus/pages/characters/add_character_page.dart';
import 'package:book_of_argus/pages/characters/characters_page.dart';
import 'package:book_of_argus/pages/login/login_page.dart';
import 'package:book_of_argus/pages/main_page.dart';
import 'package:flutter/cupertino.dart';

class FeatureRoute {
  final String name, path;
  final Widget page;

  FeatureRoute({
    required this.name,
    required this.path,
    required this.page,
  });
}

class Routes {
  static List<FeatureRoute> get all => [
        FeatureRoute(
          name: 'login',
          path: '/login',
          page: const LoginPage(),
        ),
        FeatureRoute(
          name: 'main_page',
          path: '/main_page',
          page: const MainPage(),
        ),
        FeatureRoute(
          name: 'char_page',
          path: '/char_page',
          page: CharactersPage.route(),
        ),
        FeatureRoute(
          name: 'add_char_page',
          path: '/add_char_page',
          page: AddCharPage.route(),
        ),
      ];

  static get loginRoute => all[0].path;
  static get mainPageRoute => all[1].path;
  static get charactersPageRoute => all[2].path;
  static get addCharPageRoute => all[3].path;

  static Map<String, WidgetBuilder> get allMapped {
    final routes = Map.fromEntries(
      all.map(
        (route) => MapEntry(route.path, (_) => route.page),
      ),
    );

    return routes;
  }
}
