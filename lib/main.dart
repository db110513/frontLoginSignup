import 'screens/exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(App(token: prefs.getString('token')));
}

class App extends StatelessWidget {

  final token;

  const App({@required this.token, Key? key}) : super(key: key);

  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,

        initialRoute: '/init',

        routes: {
          '/init': (context) => LogIn(),
          '/second': (context) => SignUp(),
        },

        theme: ThemeData(
          primaryColor: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),

        home: (token != null && JwtDecoder.isExpired(token) == false ) ?
          Dashboard(token: token) : LogIn()
    );
  }
}