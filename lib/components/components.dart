import 'package:flutter/material.dart';
import 'package:learn1_flutter/components/backDrop.dart';
import 'package:learn1_flutter/components/convexBottomBar.dart';
import 'package:learn1_flutter/components/draggableScrollableSheet.dart';
import 'package:learn1_flutter/components/gridList.dart';
import 'bottomBar.dart';
import 'Sheetbottom.dart';
import 'bottomNavigation.dart';

class Components extends StatefulWidget {
  const Components({Key? key}) : super(key: key);

  @override
  _ComponentsState createState() => _ComponentsState();
}

class _ComponentsState extends State<Components> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi Components'),
        backgroundColor: Colors.purple[600],
      ),
      body: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BottomBar()))
              },
              child: Text('Bottom App Bar'),
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TestBootmSheet()),
                )
              },
              child: Text('Bottom Sheet Bar'),
            ),

            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TestBottomNavigation()))
              },
              child: Text('B Navigation'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TestBackDrop()))
              },
              child: Text('Back Drop'),
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TestGridList()))
              },
              child: Text('Grid List'),
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TestConvexBottomBar()))
              },
              child: Text('Convex Bar'),
            ),
          ],
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TestDraggableScrollableSheet()))
              },
              child: Text('Draggable Scrollable Sheet'),
            ),
          ],
        )
      ]),
    );
  }
}
