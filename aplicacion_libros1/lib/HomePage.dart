import 'package:aplicacion_libros1/libros.dart';
import 'package:aplicacion_libros1/new_book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final librosRef =
    FirebaseFirestore.instance.collection('Libros').withConverter<Libro>(
          fromFirestore: (snapshots, _) => Libro.fromJson(snapshots.data()!),
          toFirestore: (libro, _) => libro.toJson(),
        );

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NuevoLibro()));
        },
        backgroundColor: const Color.fromARGB(255, 188, 21, 21),
        child: const Icon(Icons.add_outlined),
      ),
      body: StreamBuilder<QuerySnapshot<Libro>>(
        stream: librosRef.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.requireData;

          return ListView.builder(
            itemCount: data.size,
            itemBuilder: (context, index) {
              return _LibroItem(
                data.docs[index].data(),
                data.docs[index].reference,
              );
            },
          );
        },
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
        children: <Widget>[
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
            leading: const Icon(Icons.folder),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.folder),
            title: const Text(
              'Pendientes',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.folder),
            title: const Text(
              'Leidos',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_outlined),
            title: const Text(
              'Añadir carpeta',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.help_rounded),
            title: const Text(
              'Ayuda',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.build_circle_rounded),
            title: const Text(
              'Configuración',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.mail_rounded),
            title: const Text(
              'Contacto',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  static void pop(BuildContext context) {}
}

class _LibroItem extends StatelessWidget {
  _LibroItem(this.libro, this.reference);

  final Libro libro;
  final DocumentReference<Libro> reference;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(15),
      elevation: 10,
      color: const Color.fromARGB(175, 188, 21, 21),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text(
              libro.titulo.toString(),
              style: const TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold ),
            ),
            subtitle: Text(
              libro.autor.toString(),
              style: const TextStyle(color: Colors.black),
            ),
            leading: const Icon(Icons.menu_book_outlined),
          ),
          const Divider(color: Colors.black54, indent: 15, endIndent: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () {},
                child: const Text(
                  'I am a book =)',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
