import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

Container botonAceptacion(altitud,texto){
  return Container(
    padding: EdgeInsets.only(top: altitud),
    margin: const EdgeInsets.symmetric(horizontal: 30.0),
    child: ElevatedButton(
      child: Text(
      texto,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    ),
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(350, 48),
      primary: Color(ColorsSelect.btnBackgroundBo2.value),
      onPrimary: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))),
    ),
    onPressed: () {
      print("Siguiente");
    },
  ),
  );
}

Container labelInicioSesion(altitud,texto,textoBoton){
  return Container(
                margin: EdgeInsets.only(top: altitud),
                child:  Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        texto,
                        style: const TextStyle(
                          fontSize: 13
                        )
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                        primary: ColorsSelect.paginatorNext,
                        textStyle: const TextStyle(fontSize: 13),
                        ),
                        onPressed: (){},
                        child: Text(textoBoton),
                      ),
                    ]
                    ),
                ),
              );
}