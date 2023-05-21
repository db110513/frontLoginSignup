import '../screens/exports.dart';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));
String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    required this.events,
    required this.total,
    required this.skip,
    required this.limit,
  });

  List<Event> events;
  int total;
  int skip;
  int limit;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    events: List<Event>.from(json["events"].map((x) =>
      Event.fromJson(x))),
      total: json["total"],
      skip: json["skip"],
      limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "events": List<dynamic>.from(events.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

class Event {
  Event({
    required this.name,
    required this.desc,
    required this.eventDate,
    required this.pic,
    required this.price,
    required this.events,
  });

  final String name;
  final String desc;
  final String eventDate;
  final String pic;
  final int price;
  final List<String> events;

  factory Event.fromJson(Map<String, dynamic> json) =>
    Event(
      name: json["name"],
      desc: json["desc"],
      eventDate: json["eventDate"],
      pic: json["pic"],
      price: json["price"],
      events: List<String>.from(json["events"].map((x) => x)),
    );

  Map<String, dynamic> toJson() => {
    "title": name,
    "description": desc,
    "eventDate": eventDate,
    "pic": pic,
    "price": price,
    "images": List<dynamic>.from(events.map((x) => x)),
  };
}