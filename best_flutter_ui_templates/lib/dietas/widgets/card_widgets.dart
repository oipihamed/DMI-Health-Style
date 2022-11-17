import 'package:best_flutter_ui_templates/dietas/model_dietas.dart';
import 'package:best_flutter_ui_templates/fitness_app/fitness_app_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardDietas extends StatelessWidget{
  late Dietas dietas;
  CardDietas(this.dietas);
 
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            height: 100.0,
            width: 120.0,
            child: Image.asset(dietas.rutaImagen, height: 50.0, width: 60.0),
          ),
          padding(Text(dietas.tipoHorario, style: FitnessAppTheme.title)),
          padding(Text(dietas.descripcion,style: FitnessAppTheme.caption)),
          padding(Text(dietas.calorias,style:FitnessAppTheme.subtitle)),
        ],
      ),
    );
  }
  Widget padding(Widget widget){
    return Padding(padding: EdgeInsets.all(7.0),child: widget);
  }
}

/*class MyContainer extends StatelessWidget {
  const MyContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(31, 228, 226, 226).withOpacity(0.5),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40), bottomLeft: Radius.circular(40),
        )
      ),
      child: child,
    );
  }
}*/