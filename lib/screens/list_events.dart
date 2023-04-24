import 'exports.dart';
import 'package:http/http.dart' as http;

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);

  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {

  List<dynamic> events = [];

  void fetchUsuarios() async {
    final response = await http.get('https://58d9-83-41-106-41.eu.ngrok.io/api/usuarios' as Uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      events = json['usuarios'];
    });

    print('fetch users ok');

  }


  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,

    home: Scaffold(
      backgroundColor: Colors.green[500],

      appBar: AppBar(
          centerTitle: true,
          title: const Text('Listado Eventos', style: TextStyle(fontSize: 40)),
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
