import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'result_page.dart';
import 'package:bmi_calculator/component/BottomButtom.dart';
import 'package:bmi_calculator/component/RoundIconButton.dart';
import 'package:bmi_calculator/component/reusable_card.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/component/icon_content.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'result_page.dart';

String plus;
String minus;
enum Gender {
  Male,
  Female,
}
int height = 180;
int weigth = 60;
int age = 19;

//  ---------------------------------------- --------------------------------------------

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment
            .stretch, // la caja ocupa toda la pantalla horizontal
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    colour: selectedGender == Gender.Male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icons: FontAwesomeIcons.mars,
                      textIcon: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                    colour: selectedGender == Gender.Female
                        ? kActiveCardColor
                        : kInactiveCardColor, // pasamos el parametro directamente al constructor de la clase ReusableCard
                    // pasamos el parametro directamente al constructor de la clase ReusableCard
                    cardChild: IconContent(
                      icons: FontAwesomeIcons.venus,
                      textIcon: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, // horizontal
                    crossAxisAlignment: CrossAxisAlignment.baseline, // vertical
                    textBaseline: TextBaseline
                        .alphabetic, // hay que especificar con que se alinea
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kStyleNumbers, // constante
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white, // color parte activa
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555), // circulo
                      overlayColor: Color(0x29EB1555), // sombra de circulo
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      // obligatorio especificar el child del SliderTheme
                      value: height.toDouble(), // valor inicial
                      min: 120.0, // minimo valor
                      max: 220.0, // maximo valor
                      onChanged: (double newValue) {
                        // evento que recibe un double
                        setState(() {
                          // cambia el estado en el momento
                          height = newValue
                              .round(); // cambiamos el valor del numero inicial y con round() lo pasamos a int
                        });
                      },
                    ),
                  ),
                ],
              ),
              colour:
                  kActiveCardColor, // pasamos el parametro directamente al constructor de la clase ReusableCard
              // pasamos el parametro directamente al constructor de la clase ReusableCard
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGTH',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weigth.toString(),
                          style: kStyleNumbers,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                actione: () {
                                  setState(() {
                                    weigth++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                actione: () {
                                  setState(() {
                                    weigth--;
                                  });
                                },
                              ),
                            ])
                      ],
                    ), // pasamos el parametro directamente al constructor de la clase ReusableCard
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour:
                        kActiveCardColor, // pasamos el parametro directamente al constructor de la clase ReusableCard
                    // pasamos el parametro directamente al constructor de la clase ReusableCard
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kStyleNumbers,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              actione: () {
                                setState(
                                  () {
                                    age++;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              actione: () {
                                setState(
                                  () {
                                    age--;
                                  },
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButtom(
            onTap: () {
              CalculatorBrain calculatorBrain =
                  CalculatorBrain(height: height, weight: weigth);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calculatorBrain.calculateBMI(),
                    resulText: calculatorBrain.getResult(),
                    interpretation: calculatorBrain
                        .getInterpretation(calculatorBrain.getResult()),
                  ),
                ),
              );
            },
            buttonTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
