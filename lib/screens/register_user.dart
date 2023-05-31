import 'exports.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class RegUser extends StatefulWidget {

  final token;
  const RegUser({@required this.token, Key? key}) : super(key: key);

  State<RegUser> createState() => _RegUserState();
}

class _RegUserState extends State<RegUser> {

  final nameController = TextEditingController();
  final descController = TextEditingController();
  final dateController = TextEditingController();
  final picController = TextEditingController();
  final priceController = TextEditingController();

  bool noData = false;

  void initState() {
    super.initState();
    dateController.text = "";
  }

  void registerEvent() async {

    if (nameController.text.isNotEmpty && descController.text.isNotEmpty
        && dateController.text.isNotEmpty && picController.text.isNotEmpty
        && priceController.text.isNotEmpty) {

      // JSON obj
      var regBody = {
        "name" : nameController.text,
        "desc" : descController.text,
        "eventDate" : dateController.text,
        "pic" : picController.text,
        "price" : priceController.text
      };

      // send obj to backend
      var response = await http.post(Uri.parse(regEvent),
          headers: {"Content-Type" : "application/json"},
          body: jsonEncode(regBody)
      );

      var backResponse = jsonDecode(response.body);

      if (backResponse['status']) {
        toastUserCreated();
        Navigator.pushNamed(context, '/home');
      }

      else {
        toastUserError();
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
                  StudiogenesisLogo(),
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
                  HeightBox(10),
                  TextField(
                      controller: descController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 23),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          errorStyle: TextStyle(color: Colors.blue[600],
                              fontSize: 20, fontWeight: FontWeight.bold),
                          errorText: noData ? "Enter Info" : null,
                          hintText: "Description",
                          hintStyle: TextStyle(fontSize: 25),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0))))).p4().px24(),
                  HeightBox(10),
                  TextField(
                      controller: dateController,
                      keyboardType: TextInputType.text,
                      readOnly: true,
                      onTap: () async {
                        DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2100)
                        );
                        if (date != null) {
                          String formattedDate = DateFormat("dd-MM-yyyy").format(date);

                          setState(() {
                            dateController.text = formattedDate.toString();
                          });
                        }
                        else notDateSelected();
                      },
                      style: TextStyle(fontSize: 23),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          errorStyle: TextStyle(color: Colors.blue[600],
                              fontSize: 20, fontWeight: FontWeight.bold),
                          errorText: noData ? "Enter Info" : null,
                          hintText: "Event Date",
                          hintStyle: TextStyle(fontSize: 25),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0))))).p4().px24(),
                  HeightBox(10),
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
                  HeightBox(10),

                  TextField(
                      controller: priceController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 23),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          errorStyle: TextStyle(color: Colors.blue[600],
                              fontSize: 20, fontWeight: FontWeight.bold),
                          errorText: noData ? "Enter Info" : null,
                          hintText: "Price",
                          hintStyle: TextStyle(fontSize: 25),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0))))).p4().px24(),
                  HeightBox(30),

                  HStack([
                    GestureDetector(
                      onTap: () => {

                        if (nameController.text.isNotEmpty && descController.text.isNotEmpty
                            && dateController.text.isNotEmpty && picController.text.isNotEmpty
                            && priceController.text.isNotEmpty) {
                          registerEvent(),
                          toastUserCreated()
                        }
                        else {
                          toastDataError()
                        }
                      },
                      child: VxBox(child: "Register".text.white.size(25).makeCentered()
                          .p16()).blue500.roundedLg.make().px16().py16(),
                    ),
                  ]),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      toastLoggedIn();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: HStack([
                    ]).centered(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void toastUserCreated() => Fluttertoast.showToast(
  msg: "Event created",
  fontSize: 20,
);

void toastUserError() => Fluttertoast.showToast(
  msg: "Event error",
  fontSize: 20,
);

void createUserError() => Fluttertoast.showToast(
  msg: "Error",
  fontSize: 20,
);