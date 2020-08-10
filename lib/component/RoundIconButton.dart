import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  // creamos nuestro propio boton

  RoundIconButton({@required this.icon, @required this.actione});

  final IconData icon; // pasamos el icono como parametro
  final Function actione;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      // creacion de boton
      child: Icon(icon),
      onPressed: actione,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        // nueva caja con altura y ancho
        height: 56.0,
        width: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
