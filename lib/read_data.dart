
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'get_notification.dart';

class ReadDataFirebase extends StatefulWidget {
  const ReadDataFirebase({Key? key}) : super(key: key);

  @override
  _ReadDataFirebaseState createState() => _ReadDataFirebaseState();
}

class _ReadDataFirebaseState extends State<ReadDataFirebase> {

  late final FirebaseMessaging _fcm;
  late String data = "";
  DatabaseReference ref = FirebaseDatabase.instance.ref("salom");
  late Stream<DatabaseEvent> str = ref.onValue;

void getData() {

    str.listen((DatabaseEvent event) {
      print('Event Type:${event.snapshot.value}'); // DatabaseEventType.value;
      setState(() {
        data = event.snapshot.value.toString();
      });
    });
}

@override
void initState() {
   getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//
// setState(() {
//   str.listen((DatabaseEvent event) {
//     print('Event Type:${event.snapshot.value}'); // DatabaseEventType.value;
//     data = event.snapshot.value.toString();
//   });
// });

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Text(data),
      ),
    );
  }
}

