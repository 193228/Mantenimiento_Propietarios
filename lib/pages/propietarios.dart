import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/footer.dart';
import 'package:flutter_application_1/components/header.dart';
import 'package:flutter_application_1/models/users.dart';
import 'package:http/http.dart' as http;
import '../models/users.dart';

class propietarios extends StatefulWidget {
  propietarios({Key? key}) : super(key: key);

  @override
  State<propietarios> createState() => _propietarios();
}

class _propietarios extends State<propietarios> {

  late Future<List<users>> _listadoUsuarios;

  Future<List<users>> _getPropietarios() async {
    final respuesta = await http.get(
      Uri.parse("http://10.0.2.2:18081/listUser"),
      );

    List<users> propietarios = [];
    
    if (respuesta.statusCode == 200){
      String body = utf8.decode(respuesta.bodyBytes);
      final jsonData = jsonDecode(body);
      
      for (var propietario in jsonData){
        propietarios.add(users(propietario['idUsuario'], propietario['user'], propietario['password'], propietario['tipoU']));
      }

      return propietarios;

    }else{
      throw Exception("Fallo la conexión");
    }
  }

  @override
  void initState(){
    super.initState();
    //_getPropietarios();
    _listadoUsuarios = _getPropietarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generalAppBar(context,"Lista De Propietarios","assets/images/splash.png","vistaLogin"),
      body: ListTileTheme(
        contentPadding: EdgeInsets.all(15),
          iconColor: Colors.red,
          textColor: Colors.black54,
          tileColor: Colors.yellow[100],
          style: ListTileStyle.list,
          dense: true,
        child: FutureBuilder<List<users>>(
              future: _listadoUsuarios,
              builder: (context, snapshot) {
                if (snapshot.hasData){
                  final List<users> listaUsuarios = snapshot.data ?? <users>[]; //user es la lista de usuarios
                  return ListView.builder(
                    itemCount: listaUsuarios.length,
                    itemBuilder: (_, index) => Card(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(listaUsuarios[index].user),
                        subtitle: Text(listaUsuarios[index].tipoUsuario),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(onPressed: () {
                              //Navigator.pushNamed(context, 'addPropietarios'); //metodo get editar
                            }, 
                            icon: Icon(Icons.edit)),

                            IconButton(onPressed: () {
                              Navigator.pushNamed(context, 'editarPropietario'); //metodo post eliminar
                            }, 
                            icon: Icon(Icons.delete)),

                          ],
                        ),
                      )
                    )
                  );

                  //print(snapshot.data);
                  //return ListView(
                   //children: _listUsers(snapshot.data!) //snapshot.data es el arreglo en donde tengo todos mis datos.
                  //);
                }else if (snapshot.hasError){
                  print(snapshot.error);
                  return Text("Error");
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat;
        Navigator.pushNamed(context, 'addPropietarios');
      },
      backgroundColor: Colors.green,
      child: const Icon(Icons.add),
      ),
    );
  }

 List<Widget> _listUsers(List<users>data){
   List<Widget> usuarios = [];

   for (var user in data){
     usuarios.add(Card(child: Text(user.password)));
   }

   return usuarios;
 }
}