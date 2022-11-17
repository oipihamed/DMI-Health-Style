import 'package:best_flutter_ui_templates/fitness_app/admin/my_home_page.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: MyHomePage("Usuarios"),
    );
  }
}
