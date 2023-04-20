import 'exports.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {

  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController picController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool noData = false;
  bool noEmail = false;
  bool noPass = false;

  void signUp() async {

    if (nameController.text.isNotEmpty && surnameController.text.isNotEmpty
        && emailController.text.isNotEmpty && birthdateController.text.isNotEmpty
        && picController.text.isNotEmpty && passwordController.text.isNotEmpty) {

      // JSON obj
      var regBody = {
        "name" : nameController.text,
        "surname" : surnameController.text,
        "email" : emailController.text,
        "birthdate" : birthdateController.text,
        "pic" : picController.text,
        "password" : passwordController.text
      };

      // send obj to backend
      var response = await http.post(Uri.parse(regUser),
          headers: {"Content-Type" : "application/json"},
          body: jsonEncode(regBody)
      );

      var backResponse = jsonDecode(response.body);

      if (backResponse['status']) {
        toastUserCreated();
        Navigator.pushNamed(context, '/logIn');
      }

      else {
        loginError();
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
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 23),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          errorStyle: TextStyle(color: Colors.blue[600],
                              fontSize: 20, fontWeight: FontWeight.bold),
                          errorText: noData ? "Enter Info" : null,
                          hintText: "Name",
                          hintStyle: TextStyle(fontSize: 25),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0))))).p4().px24(),
                  TextField(
                      controller: surnameController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 23),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          errorStyle: TextStyle(color: Colors.blue[600],
                              fontSize: 20, fontWeight: FontWeight.bold),
                          errorText: noData ? "Enter Info" : null,
                          hintText: "Surname",
                          hintStyle: TextStyle(fontSize: 25),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0))))).p4().px24(),
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
                  TextField(
                      controller: birthdateController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 23),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          errorStyle: TextStyle(color: Colors.blue[600],
                              fontSize: 20, fontWeight: FontWeight.bold),
                          errorText: noData ? "Enter Info" : null,
                          hintText: "Birthdate",
                          hintStyle: TextStyle(fontSize: 25),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0))))).p4().px24(),
                  TextField(
                      controller: picController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 23),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          errorStyle: TextStyle(color: Colors.blue[600],
                              fontSize: 20, fontWeight: FontWeight.bold),
                          errorText: noData ? "Enter Info" : null,
                          hintText: "Picture",
                          hintStyle: TextStyle(fontSize: 25),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0))))).p4().px24(),
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
                          signUp(),
                          toastUserCreated()
                        }
                        else {
                          toastDataError()
                        }
                      },
                      child: VxBox(child: "Sign Up".text.white.size(25).makeCentered()
                          .p16()).green500.roundedLg.make().px16().py16(),
                    ),
                  ]),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      toastLoggedIn();
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

void toastDataError() => Fluttertoast.showToast(
  msg: "Insert data",
  fontSize: 20,
);

void signupError() => Fluttertoast.showToast(
  msg: "Error",
  fontSize: 20,
);

void toastLoggedIn() => Fluttertoast.showToast(
  msg: "Logged In",
  fontSize: 20,
);