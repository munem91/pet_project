import 'package:flutter/material.dart';
import 'package:pet_project/router/router.dart';
import 'package:pet_project/theme/theme.dart';

class CryptoCurenciesListApp extends StatelessWidget {
  const CryptoCurenciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CryptoCurenciesList',
      theme: darkTheme,
      routes: routes,
    );
  }
}
