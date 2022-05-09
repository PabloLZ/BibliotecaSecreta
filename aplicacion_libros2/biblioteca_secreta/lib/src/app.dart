import 'package:biblioteca_secreta/src/screens/home_page.dart';
import 'package:biblioteca_secreta/src/screens/loging_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_biblioteca_secreta_fake_backend/user.dart';

import 'connection/server_controller.dart';

ServerControler _serverControler = ServerController();

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(title: 'Material App',
    initialRoute: '/',
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.cyan,
      accentColor: Colors.cyan[300]),
    onGenerateRoute: (RouteSettings settings){
      return MaterialPageRoute(builder: (BuildContext context){
        switch (settings.name){
          case "/":
            return LoginPage(_ServerController, context);
          case "/home":
            User userLogged = settings.arguments;
            return HomePage(userLogged);
        }
      });
    },
    );
  }
}