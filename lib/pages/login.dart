import 'package:flutter/material.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _login();
}

class _login extends State<login> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
         body: Container(
           width: 200,
           height: 200,
           color: Colors.amber,
         ),
      ),
    );
  }
}