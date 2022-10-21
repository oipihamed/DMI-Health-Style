class ExerciseListData {
  ExerciseListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.exercise,
    this.kacl = 0,
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String>? exercise;
  int kacl;

  static List<ExerciseListData> tabIconsList = <ExerciseListData>[
    ExerciseListData(
      imagePath: 'assets/fitness_app/sentadilla.png',
      titleTxt: 'Sentadilla',
      kacl: 525,
      exercise: <String>['30 Sentadillas'],
      startColor: '#319DA0',
      endColor: '#3FA796',
    ),
    ExerciseListData(
      imagePath: 'assets/fitness_app/estocadas.png',
      titleTxt: 'Desplante',
      kacl: 602,
      exercise: <String>['5 Repeticiones', 'de 15 c/u'],
      startColor: '#898AA6',
      endColor: '#C9BBCF',
    ),
    ExerciseListData(
      imagePath: 'assets/fitness_app/incorporarse.png',
      titleTxt: 'Abdominal',
      kacl: 0,
      exercise: <String>['Recomendados', '30'],
      startColor: '#256D85',
      endColor: '#355764',
    ),
  ];
}
