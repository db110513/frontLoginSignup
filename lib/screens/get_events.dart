import 'exports.dart';
import 'package:http/http.dart' as http;

class GetEvents extends StatefulWidget {
  const GetEvents({Key? key}) : super(key: key);

  State<GetEvents> createState() => _GetEventsState();
}


class _GetEventsState extends State<GetEvents> {

  bool _isLoading = true;

  void initState() {
     super.initState();
     getData();
  }

  Event? eventFromAPI;

  getData() async {

    try {
      String url = "http://localhost:3009/events";
      http.Response res = await http.get(Uri.parse(url));

      if (res.statusCode == 200) {
        eventFromAPI = Event.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
    }

    catch (e) {
      debugPrint(e.toString());
    }
  }

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: const Text('Get Events', style: TextStyle(fontSize: 40)),
      ),

      body:
        _isLoading? const Center(child: CircularProgressIndicator())
          :
        ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Text(dataFromAPI!.products[i].title.toString()),
                ],
              ),
            );
          },
          // itemCount: dataFromAPI!.products.length,
        ),

    );

  }

}