import 'package:best_flutter_ui_templates/fitness_app/admin/message_response.dart';
import 'package:flutter/material.dart';
import 'package:best_flutter_ui_templates/fitness_app/admin/register_user.dart';
import 'package:best_flutter_ui_templates/fitness_app/admin/modify_user.dart';

class MyHomePage extends StatefulWidget {
  final String _title;
  MyHomePage(this._title);
  @override
  State<StatefulWidget> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  List<User> users = [
    User(name: 'Alejandro', email: 'alexsoriamqz@gmail', password: '12345'),
    User(name: 'Omar', email: 'omar@gmail', password: '12345'),
    User(name: 'Brenda', email: 'brenda@gmail', password: '12345'),
    User(name: 'Sebastian', email: 'sebas@gmail', password: '12345'),
    User(name: 'Gabriela', email: 'bagy@gmail', password: '12345'),
    User(name: 'Lendy', email: 'lendy@gmail', password: '12345'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ModifyUser(users[index])))
                  .then((newUser) {
                if (newUser != null) {
                  setState(() {
                    users.removeAt(index);
                    users.insert(index, newUser);

                    messageResponse(context,
                        newUser.name + " a sido modificado correctamente!");
                  });
                }
              });
            },
            onLongPress: () {
              removeUser(context, users[index]);
            },
            title: Text(users[index].name),
            subtitle: Text(users[index].email),
            leading: CircleAvatar(
              child: Text(users[index].name..substring(0, 1)),
            ),
            /*trailing: Icon(
              Icons.delete,
              color: Colors.red,
            ),*/
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 50.0,
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (_) => RegisterUser()))
              .then((newUser) {
            if (newUser != null) {
              setState(() {
                users.add(newUser);
                messageResponse(
                    context, newUser.name + " a sido agregado correctamente");
              });
            }
          });
        },
        tooltip: "Agregar Usuario",
        child: Icon(Icons.add),
      ),
    );
  }

  removeUser(BuildContext context, User user) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Eliminar Usuario"),
              content: Text("Esta seguro de eliminar a " + user.name + "?"),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      this.users.remove(user);
                      //Navigator.pop(context);
                      //Navigator.of(context, rootNavigator: true);
                    });
                  },
                  child: Text(
                    "Eliminar",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                /*TextButton(
                  onPressed: () {
                    //Navigator.pop(context);
                  },
                  child: Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.blue),
                  ),
                )*/
              ],
            ));
  }
}

class User {
  var name;
  var email;
  var password;

  User({this.name, this.email, this.password});
}
