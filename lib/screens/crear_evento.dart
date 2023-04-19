import 'exports.dart';
import '../models/evento.dart';
import 'package:http/http.dart' as http;

Future<Evento> crearEvento(String nombre) async {
  final http.Response response = await http.post(
    'https://58d9-83-41-106-41.eu.ngrok.io/api/usuarios' as Uri,
    headers: <String, String> {
      'Content-Type' : 'application/json; charset=UTF-8',
    },

    // jsonEncode >> JSON (map) > String
    body: jsonEncode(<String, dynamic> {
      'nombre': nombre,
    }),
  );

  if (response.statusCode == 200) return Evento.fromJson(json.decode(response.body));
  else throw Exception('Error en la creación de un evento');
}

class CrearEvento extends StatefulWidget {
  const CrearEvento({Key? key}) : super(key: key);

  State<CrearEvento> createState() => _CrearEventoState();
}

class _CrearEventoState extends State<CrearEvento> {

  final nombreController = TextEditingController();
  final descripcionController = TextEditingController();
  final fechaEventoController = TextEditingController();
  final fotoController = TextEditingController();
  final precioController = TextEditingController();

  late Future<Evento> futureEvento;

  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,

    home: Scaffold(
      backgroundColor: Colors.green[200],

      appBar: AppBar(
        centerTitle: true,
        title: const Text('Crear Evento', style: TextStyle(fontSize: 30)),
        backgroundColor: Colors.green[900],
      ),

      body: Container(
        padding: const EdgeInsets.all(10),

        child: ListView(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                child: TextFormField(
                  controller: nombreController,
                  style: TextStyle(fontSize: 25),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    icon: const Icon(Icons.person, color: Colors.green),
                    hintStyle: TextStyle(fontSize: 20),
                    hintText: 'Nombre',
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                child: TextFormField(
                  controller: descripcionController,
                  style: TextStyle(fontSize: 25),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    icon: const Icon(Icons.description_outlined, color: Colors.green),
                    hintStyle: TextStyle(fontSize: 20),
                    hintText: 'Descripción',
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                child: TextFormField(
                  style: TextStyle(fontSize: 25),
                  controller: fechaEventoController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    icon: const Icon(Icons.calendar_month, color: Colors.green),
                    hintStyle: TextStyle(fontSize: 20),
                    hintText: 'Fecha evento',
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                child: TextFormField(
                  controller: fotoController,
                  style: TextStyle(fontSize: 25),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    icon: const Icon(Icons.camera_alt, color: Colors.green),
                    hintText: 'Ruta a la foto',
                    hintStyle: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                child: TextFormField(
                  controller: precioController,
                  style: TextStyle(fontSize: 25),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    icon: const Icon(Icons.euro, color: Colors.green),
                    hintStyle: TextStyle(fontSize: 20),
                    hintText: 'Precio',
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[900],
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('BACK', style: TextStyle(fontSize: 30)),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[900],
                      padding: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
                    ),
                    onPressed: () {

                      setState(() {
                        Map<String, dynamic> jsonData = {
                          'nombre' : nombreController,
                          'descripcion' : descripcionController,
                          'fechaEvento' : fechaEventoController,
                          'foto' : fotoController,
                          'precio' : precioController
                        };

                      });


                    },
                    icon: const Icon(Icons.add),
                    label: const Text('CREAR', style: TextStyle(fontSize: 30)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
  );

  void dispose() {
    super.dispose();
  }

}
