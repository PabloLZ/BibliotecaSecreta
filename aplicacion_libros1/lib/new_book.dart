import 'package:aplicacion_libros1/userservices.dart';
import 'package:flutter/material.dart';

class NuevoLibro extends StatefulWidget {
  const NuevoLibro({Key? key}) : super(key: key);

  @override
  State<NuevoLibro> createState() => _NuevoLibroState();
}

class _NuevoLibroState extends State<NuevoLibro> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _autorController = TextEditingController();
  final GlobalKey<FormState> _formularioKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 188, 21, 21),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Colors.white,
        child: Form(
            key: _formularioKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: _tituloController,
                    decoration: const InputDecoration(labelText: 'Titulo:'),
                    validator: (String? dato) {
                      if (dato!.isEmpty) {
                        return 'Este campo es requerido';
                      }
                      return null;
                    },
                    
                  ),
                  TextFormField(
                    controller: _autorController,
                    decoration: const InputDecoration(
                      labelText: 'autor:',
                    ),
                    validator: (String? dato) {
                      if (dato!.isEmpty) {
                        return 'Este campo es requerido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          if (_formularioKey.currentState!.validate()) {
                            bool respuesta = await UserServices().addLibro(
                              _tituloController.text,
                              _autorController.text,
                            );
                            if (respuesta) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Libro agregado correctamente'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            } else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Algo salió mal'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        child: const Text('Aceptar'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        child: const Text('Cancelar'),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }

  @override
  void dispose() {
    _autorController.dispose();
    _tituloController.dispose();
    super.dispose();
  }
}
