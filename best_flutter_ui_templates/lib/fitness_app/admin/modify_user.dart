import 'dart:html';
import 'package:best_flutter_ui_templates/fitness_app/admin/text_box.dart';
import 'package:best_flutter_ui_templates/fitness_app/admin/my_home_page.dart';
import 'package:flutter/material.dart';

class ModifyUser extends StatefulWidget {
  final User _user;
  ModifyUser(this._user);
  @override
  State<StatefulWidget> createState() => _ModifyUser();
}

class _ModifyUser extends State<ModifyUser> {
  late TextEditingController controllerName;
  late TextEditingController controllerEmail;
  late TextEditingController controllerPassword;

  @override
  void initState() {
    User u = widget._user;
    controllerName = new TextEditingController(text: u.name);
    controllerEmail = new TextEditingController(text: u.email);
    controllerPassword = new TextEditingController(text: u.password);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modificar Usuario"),
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
      ),
    );
  }
}
