
class Evento {

  late final int id;
  late String nombre, descripcion, foto;
  late double precio;
  late DateTime fechaEvento;

  Evento({required this.id, required this.nombre, required this.descripcion,
    required this.fechaEvento, required this.foto, required this.precio});

  factory Evento.fromJson(Map<String, dynamic> json) =>
    Evento(
      id: json['_id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      fechaEvento: json['fechaEvento'],
      foto: json['foto'],
      precio: json['precio'],
    );

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'nombre' : nombre,
    'descripcion' : descripcion,
    'fechaEvento' : fechaEvento,
    'foto' : foto,
    'precio' : precio,
  };

}