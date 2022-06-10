import 'package:cloud_firestore/cloud_firestore.dart';

class AddLibro{
  final String titulo;
  final String autor;

  AddLibro(this.titulo, this.autor);
  
  CollectionReference Libros = FirebaseFirestore.instance.collection('Libros');
  Future<void> addLibro(){
    return Libros.add({
      'autor': autor,
      'titulo': titulo,
    }).then((value) => print('Libro añadido')).catchError((error)=> print('Error al añadir el libro: $error'));
  } 
}