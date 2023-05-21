class Usuario {

  final int id;
  final String name, surname, email, birthdate, pic, password;

  Usuario({required this.id, required this.name, required this.surname, required this.email,
    required this.birthdate, required this.pic, required this.password});

  factory Usuario.fromJson(Map<String, dynamic> json) =>
    Usuario(
      id: json['_id'],
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      birthdate: json['birthdate'],
      pic: json['pic'],
      password: json['password'],
    );

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'nombre' : name,
    'apellidos' : surname,
    'email' : email,
    'fechaNacimiento' : birthdate,
    'foto' : pic,
    'password' : password,
  };

}