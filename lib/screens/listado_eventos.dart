import 'exports.dart';
import 'package:http/http.dart' as http;

class ListadoEventos extends StatefulWidget {
  const ListadoEventos({Key? key}) : super(key: key);

  State<ListadoEventos> createState() => _ListadoEventosState();
}

class _ListadoEventosState extends State<ListadoEventos> {

  List<dynamic> usuarios = [];

  void fetchUsuarios() async {
    final response = await http.get('https://58d9-83-41-106-41.eu.ngrok.io/api/usuarios' as Uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      usuarios = json['usuarios'];
    });

    print('fetch users ok');

  }


  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,

    home: Scaffold(
      backgroundColor: Colors.green[500],

      appBar: AppBar(
          centerTitle: true,
          title: const Text('Listado Usuarios', style: TextStyle(fontSize: 40)),
          backgroundColor: Colors.green[900],
        ),

      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: Colors.green[900],
                onPressed: fetchUsuarios,
                child: const Text('GET', style: TextStyle(fontSize: 15)),

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                backgroundColor: Colors.green[900],
                onPressed: backHome,
                child: const Text('BACK', style: TextStyle(fontSize: 15)),
              ),
            ),
          ),
        ],
      )

    ),

  );

  void dispose() => super.dispose();

  void backHome() {
    Navigator.pushNamed(context, 'backHome');
  }

}
