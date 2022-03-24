import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/addPropietario.dart';
import 'package:flutter_application_1/pages/deletePropietario.dart';
import 'pages/propietarios.dart';
import 'pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      initialRoute: 'vistaPropietario',
      routes: {
        'vistaLogin': (BuildContext context) => login(),
        'editarPropietario': (BuildContext context) => deletePropietario(),
        'vistaPropietario': (BuildContext context) => propietarios(),
        'addPropietarios': (BuildContext context) => add_Propietarios()
      },
    );
  }
}