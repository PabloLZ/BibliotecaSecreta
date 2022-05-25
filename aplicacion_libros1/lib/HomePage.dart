import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   Firebase.initializeApp().then((value) {
//     runApp(MyApp());
//   });
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(title: 'Material App', home: MyHomePage());
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List libro = [];
  @override
  void initState() {
    super.initState();
    getLibros();
  }

  void getLibros() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("Libros");

    QuerySnapshot libros = await collectionReference.get();

    if (libros.docs.isNotEmpty) {
      for (var doc in libros.docs) {
        print(doc.data());
        libro.add(doc.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 188, 21, 21),
        title: const Text("Biblioteca Secreta"),
        actions: [
          IconButton(
              onPressed: () => _showDialog(context),
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.format_align_left_sharp)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      drawer: const NavDrawer(),
      body: const Center(
        child: Text(
          "Lista de libros",
          style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 188, 21, 21),
        child: const Icon(Icons.add_outlined),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text("Seleccione"),
          children: <Widget>[
            ListTile(
              title: const Text("Eliminar"),
              leading: const Icon(Icons.delete),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:  <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 188, 21, 21),
            ),
            child: Text("Drawer Header"),
          ),
          ListTile(
            title: const Text(
              'En progreso',
            style: TextStyle(fontSize: 16),
            ),
            leading: const Icon(
              Icons.folder),
            onTap: (){},
          ),
          ListTile(
            leading: const Icon(Icons.folder),
            title: const Text('Pendientes',
            style: TextStyle(fontSize: 16),
            ),
            onTap: (){},
          ),
          ListTile(
            leading: const Icon(Icons.folder),
            title: const Text('Leidos',
            style: TextStyle(fontSize: 16),
            ),
            onTap: (){},
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_outlined),
            title: const Text('Añadir carpeta',
            style: TextStyle(fontSize: 16),
            ),
            onTap: (){},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.help_rounded),
            title: const Text('Ayuda',
            style: TextStyle(fontSize: 16),
            ),
            onTap: (){},
          ),
          ListTile(
            leading: const Icon(Icons.build_circle_rounded),
            title: const Text('Configuración',
            style: TextStyle(fontSize: 16),
            ),
            onTap: (){},
          ),
          ListTile(
            leading: const Icon(Icons.mail_rounded),
            title: const Text('Contacto',
            style: TextStyle(fontSize: 16),
            ),
            onTap: (){},
          ),
        ],
      ),
    );
  }

  static void pop(BuildContext context) {}
}