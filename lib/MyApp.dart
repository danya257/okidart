import 'package:flutter/material.dart';
import 'package:okiapp/router/routes.dart';
import 'package:okiapp/theme/theme.dart';

class Okinawa extends StatelessWidget {
  const Okinawa({Key? key}) : super(key: key);

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
