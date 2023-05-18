import 'screens/exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences > store a small amount of data in your local storage
  SharedPreferences preferences = await SharedPreferences.getInstance();
  // preferences.getString > get data stored
  runApp(App(token: preferences.getString('token')));
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
          '/signUp': (context) => SignUp(),

          '/home': (context) => const Home(),
          'backHome' : (context) => const Home(),

          '//user' : (context) => const User(),
          '//event' : (context) => const Event(),

          'backEvent' : (context) => const Event(),
          'backUser' : (context) => const User(),

          '//regEvent' : (context) => const RegEvent(token: null),
          '//regUser' : (context) => const RegUser(token: null),

          '//settings' : (context) => const Ajustes(),

          '//listEvts' : (context) => const EventList(),
          '//listUsrs' : (context) => const EventList(),
        },

        theme: ThemeData(
          primaryColor: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),

        // Check if has expired && user has to login again
        // home: (token != null && JwtDecoder.isExpired(token) == false ) ?
        //   Event(token: token) : LogIn()
    );
  }
}