import 'exports.dart';

// CREANT PANTALLES EVENTS USERS DEL HOME SCREEN

class Event extends StatelessWidget {
  const Event({Key? key}) : super(key: key);

  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,

      home: (Scaffold(

        appBar: AppBar(
          centerTitle: true,
          title: const Text('User', style: TextStyle(fontSize: 40)),
          backgroundColor: Colors.green[900],
        ),

        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://www.mordeo.org/download/16712/'
                  )
              )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 208,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[500],
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
                    ),
                    onPressed: () => Navigator.pushNamed(context, '//listEvs'),
                    icon: const Icon(Icons.list),
                    label: const Text('LIST', style: TextStyle(fontSize: 30)),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 208,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[500],
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
                    ),
                    onPressed: () => Navigator.pushNamed(context, '///regEvent'),
                    icon: const Icon(Icons.add),
                    label: const Text('REGISTER', style: TextStyle(fontSize:
                    30)),
                  ),
                ),
              ],
            ),
          ),
        ),

      ))

  );

}