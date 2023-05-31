
class Event {

  List<Event> events;
  String name, desc, eventDate, pic, price;

  Event({required this.name, required this.desc, required this.eventDate,
    required this.pic, required this.price, required this.events});

  factory Event.fromJson(Map<String, dynamic> json) =>
    Event(
      events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
      name: json['name'],
      desc: json['desc'],
      eventDate: json['eventDate'],
      pic: json['birthdate'],
      price: json['price'],
    );

  Map<String, dynamic> toJson() => {
    'name' : name,
    'desc' : desc,
    'eventDate' : eventDate,
    'birthdate' : pic,
    'price' : price,
  };

}