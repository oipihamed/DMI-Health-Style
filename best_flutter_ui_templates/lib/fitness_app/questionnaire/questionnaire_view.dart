import 'package:best_flutter_ui_templates/hotel_booking/hotel_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../hotel_booking/custom_calendar.dart';

class QuestionneraPopUpView extends StatefulWidget {
  const QuestionneraPopUpView({
    Key? key,
    this.onApplyClick,
    this.onCancelClick,
    this.barrierDismissible = true,
  }) : super(key: key);

  final bool barrierDismissible;
  final Function(DateTime, DateTime)? onApplyClick;

  final Function()? onCancelClick;
  @override
  _QuestionneraPopUpViewState createState() => _QuestionneraPopUpViewState();
}

class _QuestionneraPopUpViewState extends State<QuestionneraPopUpView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  bool trSup = false;
  bool trInf = false;
  bool biceps = false;
  bool abdomen = false;
  bool piernas = false;
  bool muslos = false;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    animationController?.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AnimatedBuilder(
          animation: animationController!,
          builder: (BuildContext context, Widget? child) {
            return AnimatedOpacity(
              duration: const Duration(milliseconds: 100),
              opacity: animationController!.value,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  if (widget.barrierDismissible) {
                    Navigator.pop(context);
                  }
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: HotelAppTheme.buildLightTheme().backgroundColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(24.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              offset: const Offset(4, 4),
                              blurRadius: 8.0),
                        ],
                      ),
                      child: InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(24.0)),
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      TextFormField(
                                        /*Presta atención a la siguiente línea:*/

                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Ingresa tu peso en KG';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          contentPadding:
                                              new EdgeInsets.symmetric(
                                                  vertical: 5.0),
                                          border: InputBorder.none,
                                          prefixIcon: Padding(
                                            padding: EdgeInsets.all(0.0),
                                            child: Icon(
                                              Icons.people_outline_sharp,
                                              color: Colors.grey,
                                            ), // icon is 48px widget.
                                          ),
                                          hintText: 'Ingresa tu peso en KG',
                                          labelText: "Altura en KG",
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Ingresa tu altura en metros';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          contentPadding:
                                              new EdgeInsets.symmetric(
                                                  vertical: 0.0),
                                          border: InputBorder.none,
                                          prefixIcon: Padding(
                                            padding: EdgeInsets.all(0.0),
                                            child: Icon(
                                              Icons.people_alt,
                                              color: Colors.grey,
                                            ), // icon is 48px widget.
                                          ),
                                          hintText:
                                              'Ingresa tu altura en metros',
                                          labelText: "Altura en mts",
                                        ),
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return '¿Años de experiencia haciendo ejercicio?';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          contentPadding:
                                              new EdgeInsets.symmetric(
                                                  vertical: 0.0),
                                          border: InputBorder.none,
                                          prefixIcon: Padding(
                                            padding: EdgeInsets.all(0.0),
                                            child: Icon(
                                              Icons.question_mark,
                                              color: Colors.grey,
                                            ), // icon is 48px widget.
                                          ),
                                          hintText:
                                              'Ingresa años de experiencia',
                                          labelText: "Años de experiencia",
                                        ),
                                      ),
                                      TextFormField(
                                        /*Presta atención a la siguiente línea:*/

                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Ingresa las horas que dedicas al ejercicio semanalmente';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          contentPadding:
                                              new EdgeInsets.symmetric(
                                                  vertical: 5.0),
                                          border: InputBorder.none,
                                          prefixIcon: Padding(
                                            padding: EdgeInsets.all(0.0),
                                            child: Icon(
                                              Icons.timer,
                                              color: Colors.grey,
                                            ), // icon is 48px widget.
                                          ),
                                          hintText:
                                              'Ingresa las horas dedicadas al ejercicio semanalmente',
                                          labelText: "Tiempo en horas",
                                        ),
                                      ),
                                      Row(children: <Widget>[
                                        Text(
                                            '¿Parte del cuerpo que deseas trabajar? '),
                                        Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  'Tren inferior',
                                                ),
                                                Checkbox(
                                                  checkColor:
                                                      Colors.greenAccent,
                                                  activeColor: Color.fromARGB(
                                                      164, 32, 88, 243),
                                                  value: this.trInf,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      this.trInf = value!;
                                                      this.piernas = value;
                                                      this.muslos = value;
                                                    });
                                                  },
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  'Tren Superior',
                                                ),
                                                Checkbox(
                                                  checkColor:
                                                      Colors.greenAccent,
                                                  activeColor: Color.fromARGB(
                                                      164, 32, 88, 243),
                                                  value: this.trSup,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      this.trSup = value!;
                                                      this.biceps = value;
                                                      this.abdomen = value;
                                                    });
                                                  },
                                                ),
                                                Text(
                                                  'Biceps',
                                                ),
                                                Checkbox(
                                                  checkColor:
                                                      Colors.greenAccent,
                                                  activeColor: Color.fromARGB(
                                                      164, 32, 88, 243),
                                                  value: this.biceps,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      this.biceps = value!;
                                                    });
                                                  },
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  'Abdomen',
                                                ),
                                                Checkbox(
                                                  checkColor:
                                                      Colors.greenAccent,
                                                  activeColor: Color.fromARGB(
                                                      164, 32, 88, 243),
                                                  value: this.abdomen,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      this.abdomen = value!;
                                                    });
                                                  },
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  'Piernas',
                                                ),
                                                Checkbox(
                                                  checkColor:
                                                      Colors.greenAccent,
                                                  activeColor: Color.fromARGB(
                                                      164, 32, 88, 243),
                                                  value: this.piernas,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      this.piernas = value!;
                                                    });
                                                  },
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  'Muslos',
                                                ),
                                                Checkbox(
                                                  checkColor:
                                                      Colors.greenAccent,
                                                  activeColor: Color.fromARGB(
                                                      164, 32, 88, 243),
                                                  value: this.muslos,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      this.muslos = value!;
                                                    });
                                                  },
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ]),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 74,
                                  width: 1,
                                  color: HotelAppTheme.buildLightTheme()
                                      .dividerColor,
                                ),
                              ],
                            ),
                            const Divider(
                              height: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, bottom: 16, top: 8),
                              child: Container(
                                height: 48,
                                decoration: BoxDecoration(
                                  color: HotelAppTheme.buildLightTheme()
                                      .primaryColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(24.0)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.6),
                                      blurRadius: 8,
                                      offset: const Offset(4, 4),
                                    ),
                                  ],
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(24.0)),
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      try {
                                        // animationController.reverse().then((f) {

                                        // });

                                        Navigator.pop(context);
                                      } catch (_) {}
                                    },
                                    child: Center(
                                      child: Text(
                                        'Enviar',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
