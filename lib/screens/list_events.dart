import 'exports.dart';
import 'package:http/http.dart' as http;


class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);

  State<EventList> createState() => _EventListState();
}


class _EventListState extends State<EventList> {

  bool _isLoading = true;

  void initState() {
    super.initState();
    getData();
  }

  Event? event;

  getData() async {

    try {
      String url = 'http://localhost:3009/events';
      http.Response res = await http.get(Uri.parse(url));

      if (res.statusCode == 200) {
        event = Event.fromJson(json.decode(res.body));
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
          title: const Text('Events List', style: TextStyle(fontSize:40)),
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
                  Text("\$${event!.events[i].name.toString()}"),
                  Text("\$${event!.events[i].desc.toString()}"),
                  Text("\$${event!.events[i].eventDate.toString()}"),
                  Text("\$${event!.events[i].pic.toString()}"),
                  Text("\$${event!.events[i].price.toString()}"),
                ],
              ),
            );
          },
          itemCount: event!.events.length,
        ),
    ),

  );

  void dispose() => super.dispose();



}
