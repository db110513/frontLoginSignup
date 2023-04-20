import 'exports.dart';
import 'package:http/http.dart' as http;

class LogIn extends StatefulWidget {

  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  // used to get data from the text fields
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  bool noData = false;
  bool noEmail = false;
  bool noPass = false;

  // SharedPreferences > storing data
  late SharedPreferences preferences;

  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    // prefs > store data
    preferences = await SharedPreferences.getInstance();
  }

  void loginUser() async {

    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {

      // JSON obj
      var reqBody = {
        "email" : emailController.text,
        "password" : passwordController.text
      };

      // Uri.parse(login) > login = url + login
      var response = await http.post(Uri.parse(login),
          headers: {"Content-Type" : "application/json"},
          body: jsonEncode(reqBody)
      );

      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse['status']) {
        // token > user data from the backend
        var token = jsonResponse['token'];
        // preferences.setString > store string data into the local storage (map(key:value))
        preferences.setString('token', token);

        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
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
          // screen's width
          width: MediaQuery.of(context).size.width,

          // screen's height
          height: MediaQuery.of(context).size.height,

          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [const Color(000),const Color(000)],
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
                  const SizedBox(height: 20),
                  HeightBox(10),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 23),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Email",
                      errorStyle: TextStyle(color: Colors.blue[600],
                          fontSize: 20, fontWeight: FontWeight.bold),
                      hintStyle: TextStyle(fontSize: 23),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0))))).p4().px24(),
                  const SizedBox(height: 15),
                  TextField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 23),
                    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Password",
                        hintStyle: TextStyle(fontSize: 23),
                        errorStyle: TextStyle(color: Colors.blue[600],
                            fontSize: 20, fontWeight: FontWeight.bold),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)))),
                  ).p4().px24(),
                  const SizedBox(height: 25),
                  GestureDetector(
                    onTap: (){
                      loginUser();
                    },
                    child: HStack([
                      VxBox(child: "Log In".text.white.size(25).makeCentered()
                      .p16()).green500.roundedLg.make(),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
          },
          child: Container(
              height: 35,
              color: Colors.green[900],
              child: Center(child: "No tienes cuenta?  Sign Up".text.white.size(20).makeCentered())
          ),
        ),
      ),
    );
  }
}

void loginError() => Fluttertoast.showToast(
  msg: "Error",
  fontSize: 20,
);