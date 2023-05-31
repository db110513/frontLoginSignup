
class User {

  List<User> users;
  String name, surname, email, birthdate, pic, password;

  User({required this.name, required this.surname, required this.email,
    required this.birthdate, required this.pic,
    required this.password, required this.users});

  factory User.fromJson(Map<String, dynamic> json) =>
    User(
      users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      birthdate: json['birthdate'],
      pic: json['pic'],
      password: json['password'],
    );

  Map<String, dynamic> toJson() => {
    'nombre' : name,
    'apellidos' : surname,
    'email' : email,
    'birthdate' : birthdate,
    'pic' : pic,
    'password' : password,
  };

}