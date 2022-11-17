import 'package:best_flutter_ui_templates/fitness_app/calculator/widgets/widgets_calculator.dart';
import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

import '../fitness_app_theme.dart';

class CalculatorUI extends StatefulWidget {
  const CalculatorUI({super.key});

  final double imc = 0.0;

  @override
  State<CalculatorUI> createState() => _CalculatorUIState();

  void calcular(double peso, double altura) => imc == peso / (altura/100 * altura/100);

}

class _CalculatorUIState extends State<CalculatorUI> {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  String respuesta = "Respuesta";
  double imc = 0.0;
  late String rango;

  void calcular(double peso, double altura) => imc = peso / (altura/100 * altura/100);

  void _calcular() {
    setState(() {
      double peso = double.parse(_pesoController.text);
      double altura = double.parse(_alturaController.text)/100;
      FitnessAppTheme.nearlyBlack;
      imc = peso / (altura * altura);
      
      if (imc < 18.5) {
        rango = "Peso bajo";
      } else if(imc >= 18.6 && imc <= 24.9) {
        rango = "Peso normal ";
      } else if(imc >= 25 && imc <= 29.9){
        rango = "Sobrepeso ";
      } else if(imc >= 30 && imc <= 34.9){
        rango = "Obesidad leve ";
      } else if(imc >= 35 && imc <= 39.9){
        rango = "Obesidad media ";
      } else if(imc > 40){
        rango = "Obesidad morbida ";
      }

      respuesta = "TU IMC es: "+imc.toStringAsFixed(1) + ", estas en: " + rango;

      Future<void> addUser() {
        return users
            .add({
              'IMC': imc.toStringAsFixed(1),
            })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
      }

      addUser();

    });
  }

  Widget _sizedEspacio() {
    return const SizedBox(
      height: 30,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
            child: MyContainer(
              child: Column(
                children: [
                  Stack(
                    children: const [MyAppContainer()],
                  ),
                  _sizedEspacio(),
                  MyTextInput(
                      inputController: _pesoController, label: "Peso en Kg"),
                  _sizedEspacio(),                      
                  MyTextInput(
                      inputController: _alturaController, label: "Altura en Cm"),
                  _sizedEspacio(),
                  MyText(text: respuesta.toString()),
                  _sizedEspacio(),
                  MyButton(
                      lblText: const Text("Calcular"), 
                      press: (() => _calcular())),
                  _sizedEspacio(),
                  MyTable(),
                ],
              ),
            ),
      ),
    );
  }
}