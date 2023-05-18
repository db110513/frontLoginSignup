import 'exports.dart';

// CREANT PANTALLES EVENTS USERS DEL HOME SCREEN

class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);

  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,

      home: (Scaffold(

        appBar: AppBar(
          centerTitle: true,
          title: const Text('User', style: TextStyle(fontSize: 40)),
          backgroundColor: Colors.green[900],
        ),

        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                    image: NetworkImage(
                        'https://w0.peakpx.com/wallpaper/909/364/HD-wallpaper'
                        '-monster-abstract-android-black-green-iphone-lines-neon-pattern-stripes.jpg'
                    ),
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
                          padding: const EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
                      ),
                      onPressed: () => Navigator.pushNamed(context, '//listUsrs'),
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