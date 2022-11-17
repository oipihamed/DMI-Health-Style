import 'package:best_flutter_ui_templates/fitness_app/admin/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:best_flutter_ui_templates/fitness_app/admin/text_box.dart';

class RegisterUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterUser();
}

class _RegisterUser extends State<RegisterUser> {
  late TextEditingController controllerName;
  late TextEditingController controllerEmail;
  late TextEditingController controllerPassword;

  @override
  void initState() {
    controllerName = new TextEditingController();
    controllerEmail = new TextEditingController();
    controllerPassword = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Registrar Usuario"),
        ),
        body: ListView(
          children: [
            TextBox(controllerName, "Nombre"),
            TextBox(controllerEmail, "Correo"),
            TextBox(controllerPassword, "Contraseña"),
            ElevatedButton(
                onPressed: () {
                  String name = controllerName.text;
                  String email = controllerEmail.text;
                  String password = controllerPassword.text;

                  if (name.isNotEmpty &&
                      email.isNotEmpty &&
                      password.isNotEmpty) {
                    Navigator.pop(context,
                        new User(name: name, email: email, password: password));
                  }
                },
                child: Text("Guardar Usuario")),
          ],
        ));
  }
}
