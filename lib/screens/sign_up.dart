import 'exports.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {

  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool noData = false;
  bool noEmail = false;
  bool noPass = false;

  void registerUser() async {

    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {

      // JSON obj
      var regBody = {
        "email" : emailController.text,
        "password" : passwordController.text
      };

      // send obj to backend
      var response = await http.post(Uri.parse(registration),
          headers: {"Content-Type" : "application/json"},
          body: jsonEncode(regBody)
      );

      var backResponse = jsonDecode(response.body);
      print(backResponse['status']);

      if (backResponse['status']) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
      }

      else{
        print("Error When Connecting To Server");
      }
    }

    else {
      setState(() {
        noData = true;
      });

    }
  }

  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Container(

          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(000),Color(000)],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomCenter,
                stops: [0.0,0.8],
                tileMode: TileMode.mirror
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonLogo(),
                  HeightBox(10),
                  TextField(
                      controller: emailController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 23),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          errorStyle: TextStyle(color: Colors.blue[600],
                              fontSize: 20, fontWeight: FontWeight.bold),
                          errorText: noData ? "Enter Info" : null,
                          hintText: "Email",
                          hintStyle: TextStyle(fontSize: 25),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0))))).p4().px24(),
                  const SizedBox(height: 15),
                  TextField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    style: TextStyle(fontSize: 23),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: TextStyle(color: Colors.blue[600],
                            fontSize: 20, fontWeight: FontWeight.bold),
                        errorText: noData ? "Enter Info" : null,
                        hintText: "Password",
                        hintStyle: TextStyle(fontSize: 25),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)))),
                  ).p4().px24(),
                  HStack([
                    GestureDetector(
                      onTap: () => {
                        if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                          registerUser(),
                          toastUserCreated()
                        }
                        else {
                          toastError()
                        }
                      },
                      child: VxBox(child: "Sign Up".text.white.size(25).makeCentered()
                          .p16()).green500.roundedLg.make().px16().py16(),
                    ),
                  ]),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      print("Sign In");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
                    },
                    child: HStack([
                    ]).centered(),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
          },
          child: Container(
              height: 35,
              color: Colors.green[900],
              child: Center(child: "Tienes cuenta?  Log In".text.white.size(20).makeCentered())
          ),
        ),
      ),
    );
  }
}

void toastUserCreated() => Fluttertoast.showToast(
  msg: "User created",
  fontSize: 20,
);

void toastError() => Fluttertoast.showToast(
  msg: "Insert data",
  fontSize: 20,
);

String generatePassword() {
  String upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  String lower = 'abcdefghijklmnopqrstuvwxyz';
  String numbers = '1234567890';
  String symbols = '!@#\$%^&*()<>,./';

  String password = '';

  int passLength = 20;

  String seed = upper + lower + numbers + symbols;

  List<String> list = seed.split('').toList();

  Random rand = Random();

  for (int i = 0; i < passLength; i++) {
    int index = rand.nextInt(list.length);
    password += list[index];
  }
  return password;
}