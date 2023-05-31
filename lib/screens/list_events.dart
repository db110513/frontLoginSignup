import 'exports.dart';
import 'package:http/http.dart' as http;


String dataModelToJson(Event data) => json.encode(data.toJson());
Event dataModelFromJson(String s) => Event.fromJson(json.decode(s));

class Event {

  String name;
  String desc;
  String eventDate;
  String pic;
  int price;
  List<String> events;

  Event({
    required this.name,
    required this.desc,
    required this.eventDate,
    required this.pic,
    required this.price,
    required this.events,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    name: json["name"],
    desc: json["desc"],
    eventDate: json["eventDate"],
    pic: json["pic"],
    price: json["price"],
    events: List<String>.from(json["events"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "desc": desc,
    "eventDate": eventDate,
    "pic": pic,
    "price": price,
    "images": List<dynamic>.from(events.map((x) => x)),
  };
}

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);

  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {

  List<dynamic> events = [];

  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,

    home: Scaffold(
        backgroundColor: Colors.green[500],

        appBar: AppBar(
          centerTitle: true,
          title: const Text('Events List', style: TextStyle(fontSize:40)),
          backgroundColor: Colors.green[900],
        ),

        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  heroTag: "btn1",
                  backgroundColor: Colors.green[900],
                  onPressed: () {Navigator.pushNamed(context, '//event');},
                  child: const Text('GET', style: TextStyle(fontSize: 15)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: FloatingActionButton(
                  heroTag: "btn2",
                  backgroundColor: Colors.green[900],
                  onPressed: () {Navigator.pushNamed(context, '//event');},
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
