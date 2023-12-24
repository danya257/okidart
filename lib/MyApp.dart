import 'package:flutter/material.dart';
import 'package:okiapp/router/routes.dart';
import 'package:okiapp/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Okinawabar',
      theme: darkTheme,
      routes: routes,
    );
  }
}
