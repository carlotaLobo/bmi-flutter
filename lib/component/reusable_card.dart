import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // extract widget (container) crea una clase y podemos reutilizar codigo
  // ponemos final, porque si no habria un warning por haber un elemento mutable.
  final Color colour;
  // objeto widget que se crea si se lo pasamos
  final Widget cardChild;
  final Function onPress;

  ReusableCard(
      {@required this.colour,
      this.cardChild,
      this.onPress}); // constructor para pasar parametros de los atributos que pueden cambiar
  // @required lo hace obligatorio
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child:
            cardChild, // metemos o no un hijo en esa posicion, en el momento de crear la caja
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: colour, // variable
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
