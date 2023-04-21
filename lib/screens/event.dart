// import 'exports.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_slidable/flutter_slidable.dart';
//
// class Event extends StatefulWidget {
//
//   final token;
//   const Event({@required this.token, Key? key}) : super(key: key);
//   State<Event> createState() => _EventState();
// }
//
// class _EventState extends State<Event> {
//
//   late String userId, name, desc, eventDate, pic;
//   late double price;
//   bool noData = false;
//
//   TextEditingController userIdController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController descController = TextEditingController();
//   TextEditingController eventDateController = TextEditingController();
//   TextEditingController picController = TextEditingController();
//   TextEditingController priceController = TextEditingController();
//
//   List? items;
//
//   void initState() {
//
//     super.initState();
//     //
//     // Map <String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
//     //
//     // userId = jwtDecodedToken['_id'];
//     // name = jwtDecodedToken['name'];
//     // desc = jwtDecodedToken['desc'];
//     // eventDate = jwtDecodedToken['eventDate'];
//     // pic = jwtDecodedToken['pic'];
//     // price = jwtDecodedToken['price'];
//     // getTodoList(userId);
//
//   }
//
//   void getTodoList(userId) async {
//     var regBody = {
//       "userId":userId
//     };
//
//     var response = await http.post(Uri.parse(getEventList),
//         headers: {"Content-Type":"application/json"},
//         body: jsonEncode(regBody)
//     );
//
//     var jsonResponse = jsonDecode(response.body);
//     items = jsonResponse['success'];
//
//     setState(() {
//     });
//   }
//
//   void deleteItem(id) async {
//     var regBody = {
//       "id" : id
//     };
//
//     var response = await http.post(Uri.parse(deleteEvent),
//         headers: {"Content-Type" : "application/json"},
//         body: jsonEncode(regBody)
//     );
//
//     var jsonResponse = jsonDecode(response.body);
//
//     if (jsonResponse['status']) {
//       getTodoList(userId);
//     }
//
//   }
//
//   void addEvent() async {
//
//     /*  TextEditingController userIdController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController descController = TextEditingController();
//   TextEditingController eventDateController = TextEditingController();
//   TextEditingController picController = TextEditingController();
//   TextEditingController priceController = TextEditingController();*/
//
//     if (nameController.text.isNotEmpty && descController.text.isNotEmpty
//         && eventDateController.text.isNotEmpty && picController.text.isNotEmpty
//         && priceController.text.isNotEmpty) {
//
//       // JSON obj
//       var regBody = {
//         "name" : nameController.text,
//         "desc" : descController.text,
//         "eventDate" : eventDateController.text,
//         "pic" : picController.text,
//         "price" : priceController.text,
//       };
//
//       // send obj to backend
//       var response = await http.post(Uri.parse(regUser),
//           headers: {"Content-Type" : "application/json"},
//           body: jsonEncode(regBody)
//       );
//
//       var backResponse = jsonDecode(response.body);
//
//       if (backResponse['status']) {
//         toastEventCreated();
//         Navigator.pushNamed(context, '/logIn');
//       }
//
//       else {
//         loginError();
//       }
//     }
//
//     else {
//       setState(() {
//         noData = true;
//       });
//
//     }
//   }
//
//
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       backgroundColor: Colors.lightBlueAccent,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: EdgeInsets.only(top: 60.0,left: 30.0,right: 30.0,bottom: 30.0),
//             child: Center(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(email)
//                   // CircleAvatar(child: Icon(Icons.list,size: 30.0,),backgroundColor: Colors.white,radius: 30.0,),
//                   // SizedBox(height: 10.0),
//                   // Text('ToDo with NodeJS + Mongodb',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w700),),
//                   // SizedBox(height: 8.0),
//                   // Text('5 Task',style: TextStyle(fontSize: 20),),
//
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: items == null ? null : ListView.builder(
//                     itemCount: items!.length,
//                     itemBuilder: (context,int index){
//                       return Slidable(
//                         key: const ValueKey(0),
//                         endActionPane: ActionPane(
//                           motion: const ScrollMotion(),
//                           dismissible: DismissiblePane(onDismissed: () {}),
//                           children: [
//                             SlidableAction(
//                               backgroundColor: Color(0xFFFE4A49),
//                               foregroundColor: Colors.white,
//                               icon: Icons.delete,
//                               label: 'Delete',
//                               onPressed: (BuildContext context) {
//                                 print('${items![index]['_id']}');
//                                 deleteItem('${items![index]['_id']}');
//                               },
//                             ),
//                           ],
//                         ),
//                         child: Card(
//                           borderOnForeground: false,
//                           child: ListTile(
//                             leading: Icon(Icons.task),
//                             title: Text('${items![index]['title']}'),
//                             subtitle: Text('${items![index]['desc']}'),
//                             trailing: Icon(Icons.arrow_back),
//                           ),
//                         ),
//                       );
//                     }
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _displayTextInputDialog(context) ,
//         child: Icon(Icons.add),
//         tooltip: 'Add Event',
//       ),
//     );
//   }
//
//   Future<void> _displayTextInputDialog(BuildContext context) async {
//
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//               title: Text('Add Event'),
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   TextFormField(
//                     controller: nameController,
//                     keyboardType: TextInputType.text,
//                     style: TextStyle(fontSize: 20),
//                     decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.white,
//                         hintText: "Name",
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(10.0)))),
//                   ).p4().px8(),
//                   TextFormField(
//                     controller: descController,
//                     keyboardType: TextInputType.text,
//                     style: TextStyle(fontSize: 20),
//                     decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.white,
//                         hintText: "Description",
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(10.0)))),
//                   ).p4().px8(),
//                   TextFormField(
//                     controller: eventDateController,
//                     keyboardType: TextInputType.text,
//                     style: TextStyle(fontSize: 20),
//                     decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.white,
//                         hintText: "Event Date",
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(10.0)))),
//                   ).p4().px8(),
//                   TextFormField(
//                     controller: picController,
//                     keyboardType: TextInputType.text,
//                     style: TextStyle(fontSize: 20),
//                     decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.white,
//                         hintText: "Picture",
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(10.0)))),
//                   ).p4().px8(),
//                   TextFormField(
//                     controller: priceController,
//                     keyboardType: TextInputType.text,
//                     style: TextStyle(fontSize: 20),
//                     decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.white,
//                         hintText: "Price",
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(10.0)))),
//                   ).p4().px8(),
//
//                   ElevatedButton(
//                     onPressed: () { addEvent();},
//                     child: Text("Add", style: TextStyle(fontSize: 25))
//                   )
//                 ],
//               )
//           );
//         }
//       );
//   }
// }
//
// void popUp() => Fluttertoast.showToast(
//   msg: "POP UP !",
//   fontSize: 20,
// );
//
// void dashboardError() => Fluttertoast.showToast(
//   msg: "Error",
//   fontSize: 20,
// );