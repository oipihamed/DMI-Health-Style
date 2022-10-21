import 'package:best_flutter_ui_templates/fitness_app/calculator/ui_calaculator.dart';
import 'package:best_flutter_ui_templates/fitness_app/models/tabIcon_data.dart';
import 'package:best_flutter_ui_templates/fitness_app/questionnaire/questionnaire_view.dart';
import 'package:best_flutter_ui_templates/fitness_app/training/training_screen.dart';
import 'package:flutter/material.dart';
import 'bottom_navigation_view/bottom_bar_view.dart';
import 'fitness_app_theme.dart';
import 'my_diary/my_diary_screen.dart';

class FitnessAppHomeScreen extends StatefulWidget {
  @override
  _FitnessAppHomeScreenState createState() => _FitnessAppHomeScreenState();
}

class _FitnessAppHomeScreenState extends State<FitnessAppHomeScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));
  //DatabaseReference referenceT =
  //    FirebaseDatabase.instance.reference().child("Users/");
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: FitnessAppTheme.background,
  );

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    //referenceT.onValue.listen((event) {
    //  final data = event.snapshot.value;
    //  print("Datos de bd" + data.toString());
    //});

    //Muestra cuestionario Inicial
    tabIconsList[0].isSelected = true;
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = MyDiaryScreen(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0 || index == 2) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  FocusScope.of(context).requestFocus(FocusNode());
                  // setState(() {
                  //   isDatePopupOpen = true;
                  // });
                  showQInitDialaog(context: context);
                  tabBody =
                      MyDiaryScreen(animationController: animationController);
                });
              });
            } else if (index == 1) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      TrainingScreen(animationController: animationController);
                });
              });
            } else if (index == 3) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = CalculatorUI();
                });
              });
            }
          },
        ),
      ],
    );
  }

  //Funcion muestra cuestionario inicial
  void showQInitDialaog({BuildContext? context}) {
    showDialog<dynamic>(
      context: context!,
      builder: (BuildContext context) => QuestionneraPopUpView(
        barrierDismissible: true,
        onApplyClick: (DateTime startData, DateTime endData) {
          setState(() {
            startDate = startData;
            endDate = endData;
          });
        },
        onCancelClick: () {},
      ),
    );
  }
}
