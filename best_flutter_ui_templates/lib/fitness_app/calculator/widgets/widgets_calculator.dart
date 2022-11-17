import "package:flutter/material.dart";

class MyTextInput extends StatelessWidget {
  const MyTextInput({super.key, required this.inputController, required this.label});

  final TextEditingController inputController;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Padding(
        padding: const EdgeInsets.only(left: 70, right: 70),
        child: TextFormField(
          controller: inputController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            prefixIcon: const Icon(Icons.person, color: Colors.blue),
            labelStyle: const TextStyle(fontSize: 18, color: Colors.black87),
            labelText: label,
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyText extends StatelessWidget {
  MyText({super.key, required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.black87, fontSize: 17, fontWeight: FontWeight.bold),
    );
  }
}

class MyButton extends StatelessWidget {
  MyButton({super.key, required this.lblText, required this.press});

  final Text lblText;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        textStyle: const TextStyle(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500
        )
      ), 
      child: lblText,
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      margin: const EdgeInsets.only(top: 0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(31, 228, 226, 226).withOpacity(0.5),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40), bottomLeft: Radius.circular(40),
        )
      ),
      child: child,
    );
  }
}


class MyAppContainer extends StatelessWidget {
  const MyAppContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(top: 0),
      decoration: BoxDecoration(
        color: Color.fromARGB(223, 85, 66, 228).withOpacity(0.5),
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(70)),
        )
      );
  }
}

class MyTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Table(border: TableBorder.all(),
      children: const [
        TableRow(
          children: [
            Text('Menor a 18.5'),
            Text('Peso bajo'),
          ]),
        TableRow(
          children: [
            Text('18.6 a 24.9'),
             Text('Peso normal'),
          ]),
        TableRow(
          children: [
           Text('25 a 29.9'),
           Text('Sobrepeso'),
          ]),
        TableRow(
          children: [
            Text('30 a 34.9'),
            Text('Obesidad leve'),
           ]),
        TableRow(
         children: [
           Text('35 a 39.9'),
           Text('Obesidad media'),
          ]),
        TableRow(
          children: [
          Text('Mayor a 40'),
          Text('Obesidad morbida'),
        ]),
      ],
    )
  );
}
}