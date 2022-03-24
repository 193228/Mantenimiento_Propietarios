import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/footer.dart';
import 'package:flutter_application_1/components/header.dart';
import '../components/body.dart';

class add_Propietarios extends StatefulWidget {
  add_Propietarios({Key? key}) : super(key: key);

  @override
  State<add_Propietarios> createState() => _add_propietarios();
}

class _add_propietarios extends State<add_Propietarios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generalAppBar(context,"Agregar Usuario","assets/images/splash.png","vistaPropietario"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            textoInformativo("Agrega Un Nuevo Propietario", 30.0),
            campoInformacion(30.0,"Usuario","Ingrese Su Username", ""),
            campoInformacion(15.0,"Password","Direccion De Correo", ""),
            campoInformacion(15.0,"Tipo De Usuario","Ingrese Si Es Empleado O Propietario", ""),
            botonAceptacion(35.00, "Agregar Usuario"),
          ],
        ),
      )
    );
  }
}