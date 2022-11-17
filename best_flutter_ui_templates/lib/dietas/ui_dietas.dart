import 'package:best_flutter_ui_templates/dietas/list_Dietas.dart';
import 'package:best_flutter_ui_templates/fitness_app/calculator/widgets/widgets_calculator.dart';
import "package:flutter/material.dart";
import '../fitness_app/fitness_app_theme.dart';

class DietasUI extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState()=>_DietasUIState();
}

class _DietasUIState extends State<DietasUI> {
  final ScrollController scrollController =new ScrollController();
  double topBarOpacity = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Comidas de Hoy")),
      ),
      //body: ListDietas(),
      body: ListDietas(scrollController: scrollController),

    );
  }
 
  
}
