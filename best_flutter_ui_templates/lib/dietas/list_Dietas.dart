import 'package:best_flutter_ui_templates/dietas/model_dietas.dart';
import 'package:best_flutter_ui_templates/dietas/widgets/card_widgets.dart';
import "package:flutter/material.dart";
import '../fitness_app/fitness_app_theme.dart';

class ListDietas extends StatefulWidget {
  const ListDietas({Key?key,this.scrollController}):super (key: key);
  final ScrollController?scrollController;
  @override
 //State<StatefulWidget> createState()=>ListDietaState();
 State<StatefulWidget> createState()=>ListDietaState();
  
}

class ListDietaState extends State<ListDietas>{

 List<Dietas>dietas=Dietas.dietas();
 Widget build(BuildContext context){
  return ListView.builder(
    controller: widget.scrollController,
    shrinkWrap: true,
    itemCount: dietas.length,
    itemBuilder: (BuildContext context, int  index){
    return Dismissible(
      key: ObjectKey(dietas[index]),
      child: CardDietas(dietas[index]),
      onDismissed: (direction) {
        setState(() {
          dietas.remove(index);
        });
      },
    );
  });
 }
}