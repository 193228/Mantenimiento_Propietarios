import 'package:flutter/material.dart';
import 'package:flutter_application_1/styles/colors.dart';

class deletePropietario extends StatefulWidget {
  deletePropietario({Key? key}) : super(key: key);

  @override
  State<deletePropietario> createState() => _deletePropietarioState();
}

class _deletePropietarioState extends State<deletePropietario> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: ColorsSelect.tile,
    );
  }
}