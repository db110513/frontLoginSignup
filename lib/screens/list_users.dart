import 'exports.dart';
import 'package:http/http.dart' as http;

class ListUsers extends StatefulWidget {
  const ListUsers({Key? key}) : super(key: key);

  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {

  bool _isLoading = true;

  void initState() {
    super.initState();
    getData();
  }

  Event? user;

  getData() async {

    try {
      String url = 'http://localhost:3009/users';
      http.Response res = await http.get(Uri.parse(url));

      if (res.statusCode == 200) {
        user = Event.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }

    }

    catch (e) {
      debugPrint(e.toString());
    }

  }


  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,

    home: Scaffold(
      backgroundColor: Colors.green[500],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Users List', style: TextStyle(fontSize: 40)),
        backgroundColor: Colors.green[900],
      ),

    body:
      _isLoading? const Center(child: CircularProgressIndicator())
          :
      ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$${user!.events[i].name.toString()}"),
                    Text("\$${user!.events[i].desc.toString()}"),
                    Text("\$${user!.events[i].eventDate.toString()}"),
                    Text("\$${user!.events[i].pic.toString()}"),
                    Text("\$${user!.events[i].price.toString()}"),
                    Text("\$${user!.events[i].password.toString()}"),
                  ],
                ),
              );
            },
            itemCount: user!.events.length,
          ),
      )
  );

  void dispose() => super.dispose();

}