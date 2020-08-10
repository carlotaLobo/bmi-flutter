import 'package:flutter/material.dart';
import 'package:bmi_calculator/constant.dart';
class BottomButtom extends StatelessWidget {
  BottomButtom({@required this.buttonTitle, @required this.onTap});
  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity, // ocupa toda la pantalla
        height: kBottomHeightContainer, // variable
      ),
    );
  }
}