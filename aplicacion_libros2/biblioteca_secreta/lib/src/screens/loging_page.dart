import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 60),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.cyan,
                  Colors.cyan,
                ],
              ),
            ),
            child: const Icon(Icons.menu_book_rounded),
            height: 200,
          ),
          Center(
            child: Card(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 260),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Usuario:"),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
