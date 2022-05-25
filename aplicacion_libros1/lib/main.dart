// import 'package:aplicacion_libros1/Authenticator.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:aplicacion_libros1/Authenticator_button.dart';
import 'package:aplicacion_libros1/HomePage.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: ()=> GoogleAuthenticator()),
        GetPage(name: '/second', page: ()=> const MyHomePage())
      ],
      
    );
  }
}



// MaterialApp(home: GoogleAuthenticator())