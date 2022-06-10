import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices{
  CollectionReference Libros = FirebaseFirestore.instance.collection('Libros');
  Future <bool> addLibro(String Titulo, String autor) async {
    await Libros.add({
      'autor': autor,
      'titulo': Titulo,
    }).then((value) => print('Libro añadido')).catchError((error)=> print('Error al añadir el libro: $error'));
    return true;
  } 
}


