import 'exports.dart';

// CREANT PANTALLES EVENTS USERS DEL HOME SCREEN

class Event extends StatelessWidget {
  const Event({Key? key}) : super(key: key);

  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,

      home: (Scaffold(

        appBar: AppBar(
          centerTitle: true,
          title: const Text('Event', style: TextStyle(fontSize: 40)),
          backgroundColor: Colors.green[900],
        ),

        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://w0.peakpx.com/wallpaper/909/364/HD-wallpaper'
                          '-monster-abstract-android-black-green-iphone-lines-neon-pattern-stripes.jpg'
                  ),
                  fit: BoxFit.contain,
                ),
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
                      onPressed: () => Navigator.pushNamed(context, '//listEvts'),
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
                      onPressed: () => Navigator.pushNamed(context, '/backHome'),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('BACK', style: TextStyle(fontSize:30)),
                    ),
                  ),
                  SizedBox(
                    width: 208,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[500],
                          padding: const EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
                      ),
                      onPressed: () => Navigator.pushNamed(context, '//regUser'),
                      icon: const Icon(Icons.add),
                      label: const Text('REGISTER', style: TextStyle(fontSize:
                      30)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

      ))

  );

}