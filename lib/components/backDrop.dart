import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';

class TestBackDrop extends StatefulWidget {
  const TestBackDrop({Key? key}) : super(key: key);

  @override
  _TestBackDropState createState() => _TestBackDropState();
}

class _TestBackDropState extends State<TestBackDrop> {
  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      appBar: BackdropAppBar(
        title: Text('Salom Back Drop Title'),
      ),
      backLayer: Center(child: Text('Hello degani salom degain',style:TextStyle(color: Colors.white)),),
      frontLayer: Center(
        child: Text("Salom degani Hello degani"),
      ),
      // frontLayerBackgroundColor: Colors.teal,
    );
  }
}
