import 'exports.dart';

class Ajustes extends StatefulWidget {
  const Ajustes({Key? key}) : super(key: key);

  State<Ajustes> createState() => _AjustesState();
}

class _AjustesState extends State<Ajustes> {

  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,

    home: Scaffold(
      backgroundColor: Colors.green[200],

      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ajustes', style: TextStyle(fontSize: 40)),
        backgroundColor: Colors.green[900],
      ),

      body: Container(
        padding: const EdgeInsets.all(10),

        child: ListView(
          children: [

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
                    Navigator.pushNamed(context, '/');
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('CERRAR SESIÓN', style: TextStyle(fontSize:20)),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[900],
                      padding: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
                  ),
                  onPressed: () {
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('CREAR', style: TextStyle(fontSize: 20)),
                ),
              ],
            )
          ],
        ),



      ),

    ),

  );

  void dispose() => super.dispose();

}
