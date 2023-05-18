import 'exports.dart';
import 'package:dio/dio.dart';

class ListUsers extends StatefulWidget {
  const ListUsers({Key? key}) : super(key: key);

  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {

  List<dynamic> events = [];


  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,

    home: Scaffold(
        backgroundColor: Colors.green[500],

        appBar: AppBar(
          centerTitle: true,
          title: const Text('Users List', style: TextStyle(fontSize: 40)),
          backgroundColor: Colors.green[900],
        ),

        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  heroTag: "btn1",
                  backgroundColor: Colors.green[900],
                  onPressed: fetchData,
                  child: const Text('GET', style: TextStyle(fontSize: 15)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  heroTag: "btn2",
                  backgroundColor: Colors.green[900],
                  onPressed: () { Navigator.pushNamed(context, '//user'); },
                  child: const Text('BACK', style: TextStyle(fontSize: 15)),
                ),
              ),
            ),
          ],
        )

    ),

  );

  void dispose() => super.dispose();

}

void fetchData() async {

  var dio = Dio();

  var response = await dio.get(events);

  print (response.statusCode);
  print (response.data.toString());

}