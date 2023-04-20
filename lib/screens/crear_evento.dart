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

  final token;
  const CrearEvento({@required this.token, Key? key}) : super(key: key);

  State<CrearEvento> createState() => _CrearEventoState();
}

class _CrearEventoState extends State<CrearEvento> {

  final nameController = TextEditingController();
  final descController = TextEditingController();
  final eventDateController = TextEditingController();
  final picController = TextEditingController();
  final priceController = TextEditingController();

  bool noData = false;

  void signUp() async {

    if (nameController.text.isNotEmpty && descController.text.isNotEmpty
        && eventDateController.text.isNotEmpty && picController.text.isNotEmpty
        && priceController.text.isNotEmpty) {

      // JSON obj
      var regBody = {
        "name" : nameController.text,
        "surname" : descController.text,
        "email" : eventDateController.text,
        "birthdate" : picController.text,
        "pic" : priceController.text,
      };

      // send obj to backend
      var response = await http.post(Uri.parse(regEvent),
          headers: {"Content-Type" : "application/json"},
          body: jsonEncode(regBody)
      );

      var backResponse = jsonDecode(response.body);

      if (backResponse['status']) {
        toastEventCreated();
        Navigator.pushNamed(context, '/logIn');
      }

      else {
        loginError();
      }
    }

    else {
      setState(() {
        // noData = true;
      });

    }
  }


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

        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonLogo(),
                HeightBox(10),
                TextField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 23),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: TextStyle(color: Colors.blue[600],
                            fontSize: 20, fontWeight: FontWeight.bold),
                        errorText: noData ? "Enter Info" : null,
                        hintText: "Name",
                        hintStyle: TextStyle(fontSize: 25),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))))).p4().px24(),
                TextField(
                    controller: descController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 23),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: TextStyle(color: Colors.blue[600],
                            fontSize: 20, fontWeight: FontWeight.bold),
                        errorText: noData ? "Enter Info" : null,
                        hintText: "Description",
                        hintStyle: TextStyle(fontSize: 25),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))))).p4().px24(),
                TextField(
                    controller: eventDateController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 23),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: TextStyle(color: Colors.blue[600],
                            fontSize: 20, fontWeight: FontWeight.bold),
                        errorText: noData ? "Enter Info" : null,
                        hintText: "Event Date",
                        hintStyle: TextStyle(fontSize: 25),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))))).p4().px24(),
                TextField(
                    controller: picController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 23),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: TextStyle(color: Colors.blue[600],
                            fontSize: 20, fontWeight: FontWeight.bold),
                        errorText: noData ? "Enter Info" : null,
                        hintText: "Picture",
                        hintStyle: TextStyle(fontSize: 25),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))))).p4().px24(),
                TextField(
                    controller: priceController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 23),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: TextStyle(color: Colors.blue[600],
                            fontSize: 20, fontWeight: FontWeight.bold),
                        errorText: noData ? "Enter Info" : null,
                        hintText: "Price",
                        hintStyle: TextStyle(fontSize: 25),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))))).p4().px24(),
                HStack([
                  GestureDetector(
                    onTap: () => {
                      if (nameController.text.isNotEmpty && descController.text.isNotEmpty
                          && eventDateController.text.isNotEmpty && picController.text.isNotEmpty
                          && priceController.text.isNotEmpty) {
                        signUp(),
                        toastEventCreated()
                      }
                      else {
                        toastDataError()
                      }
                    },
                    child: VxBox(child: "Sign Up".text.white.size(25).makeCentered()
                        .p16()).green500.roundedLg.make().px16().py16(),
                  ),
                ]),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    toastLoggedIn();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
                  },
                  child: HStack([
                  ]).centered(),
                ),
              ],
            ),
          ),
        ),
        ),
      ),
  );

  void dispose() {
    super.dispose();
  }

}

void toastEventCreated() => Fluttertoast.showToast(
  msg: "Event created",
  fontSize: 20,
);