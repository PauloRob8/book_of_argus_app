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
      ];

  static Map<String, WidgetBuilder> get allMapped {
    MapEntry('/login', (_) => const LoginPage());
    MapEntry('/main_page', (_) => const MainPage());

    final routes = Map.fromEntries(
      all.map(
        (route) => MapEntry(route.path, (_) => route.page),
      ),
    );

    return routes;
  }
}
