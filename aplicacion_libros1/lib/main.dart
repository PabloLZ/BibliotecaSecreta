import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Material App', home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 188, 21, 21),
            ),
            child: Text("Drawer Header"),
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text('En progreso'),
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text('Pendientes'),
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text('Leidos'),
          ),
          ListTile(
            leading: Icon(Icons.add_circle_outlined),
            title: Text('Añadir carpeta'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.help_rounded),
            title: Text('Ayuda'),
          ),
          ListTile(
            leading: Icon(Icons.build_circle_rounded),
            title: Text('Configuración'),
          ),
          ListTile(
            leading: Icon(Icons.mail_rounded),
            title: Text('Contacto'),
          ),
        ],
      ),
    );
  }
}
