import 'package:flutter/material.dart';
import 'package:bmi_calculator/constant.dart';


class IconContent extends StatelessWidget {
  final IconData icons;
  final String textIcon;
  IconContent({@required this.icons, @required this.textIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      // widget creado desde clase ReusableCard()
      mainAxisAlignment: MainAxisAlignment.center, // alinear al centro
      children: <Widget>[
        Icon(icons, size: 80.0),
        SizedBox(
          height: 15.0,
        ),
        Text(
          textIcon,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
