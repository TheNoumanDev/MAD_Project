import 'package:flutter/material.dart';

import '../../utilities/services.dart';

Widget buildButton(String text, TextEditingController _email,
    TextEditingController _password, BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 25.0),
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 5.0,
        //borderRadius: BorderRadius.circular(30.0),
        //onPrimary: Colors.white, // foreground
      ),
      onPressed: () {
        signIn(_email, _password, context);
      },
      child: Text(text, style: rButtonTextStyle),
    ),
  );
}

const rButtonTextStyle = TextStyle(
  color: Color.fromRGBO(37, 24, 78, 1),
  letterSpacing: 1.5,
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

const rHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

const rLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final rBoxDecorationStyle = BoxDecoration(
  color: const Color.fromRGBO(37, 24, 78, 0.5),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: const [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

Future<void> ShowDialogGeneric(
  BuildContext context,
  String text,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Error Occoured"),
        content: Text(text),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(
                backgroundColor: Colors.blue, foregroundColor: Colors.white),
            child: const Text("OK"),
          )
        ],
      );
    },
  );
}
