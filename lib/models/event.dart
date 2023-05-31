
class Event {

  List<Event> events;
  String name, desc, eventDate, pic;
  double price;

  Event({required this.name, required this.desc, required this.eventDate,
   required this.pic, required this.price, required this.events});

  factory Event.fromJson(Map<String, dynamic> json) =>
    Event(
      name : json['name'],
      desc : json['desc'],
      eventDate : json['eventDate'],
      pic : json['pic'],
      price : json['price'],
      events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
    );

  Map<String, dynamic> toJson() => {
    'name' : name,
    'desc' : desc,
    'eventDate' : eventDate,
    'pic' : pic,
    'price' : price,
    "events" : List<dynamic>.from(events.map((x) => x.toJson())),
  };

}