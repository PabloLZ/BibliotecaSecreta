class Libro{
  
  Libro({
    required this.titulo,
    required this.autor,
    this.key,
  });
  
  String titulo;
  String autor;
  String? key;

  Libro.fromJson(Map<String, Object?> json)
      : this(
          autor: json['autor']! as String,
          titulo: json['titulo']! as String,
        ); 

  Map<String, Object?> toJson() {
    return {
      'autor': autor,
      'key': key,
      'title': titulo,
    };
  }
}