import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

bool value = false;
int _value = 1;

Container textoInformativo(texto,altitud){
  return Container(
      padding: EdgeInsets.only(top: altitud),
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 15
        ),
      )
    );
}

Container campoInformacion(altitud,texto,hint,helper){
  return Container(
      padding: EdgeInsets.only(top: altitud),
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            texto,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                helperText: helper,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: hint),
          ),
        ],
      ));
}

Container aceptarTerminos(context,altitud) {
  return Container(
    padding: EdgeInsets.only(top: altitud),
    margin: const EdgeInsets.only(right: 30.0),
    child: ListTile(
      title: (
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              const TextSpan(
                text: 'Al registrarme acepto los ',
                style: TextStyle(color: ColorsSelect.btnTextBo1, fontSize: 12, decoration: TextDecoration.none),
                ),

              TextSpan(
                text: 'terminos y condiciones ',
                style: const TextStyle(color: ColorsSelect.paginatorNext, fontSize: 12, decoration: TextDecoration.none),
                recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('Terminos y condiciones');
                }),

              const TextSpan(
                text: 'y la ',
                style: TextStyle(color: ColorsSelect.btnTextBo1, fontSize: 12, decoration: TextDecoration.none),
                ),

              TextSpan(
                text: 'politica de privacidad ',
                style: const TextStyle(color: ColorsSelect.paginatorNext, fontSize: 12, decoration: TextDecoration.none),
                recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('Politica de privacidad');
                }),
              
            ]
          )
        )
      ),
      //);
      leading: Radio(
        value: _value,
        groupValue: _value,
        onChanged: (_value) {
          setState(() {
            _value = value;
          });
        },
      ),
    ),
  );
}

void setState(Null Function() param0) {}