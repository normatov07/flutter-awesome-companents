// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestDraggableScrollableSheet extends StatefulWidget {
  const TestDraggableScrollableSheet({Key? key}) : super(key: key);

  @override
  _TestDraggableScrollableSheetState createState() => _TestDraggableScrollableSheetState();
}

class _TestDraggableScrollableSheetState extends State<TestDraggableScrollableSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.12,
      maxChildSize: 0.8,
      builder: (BuildContext context, ScrollController scrollController){
        return Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20)
            )
          ),
          child: Scrollbar(
            child:ListView.builder(
              controller: scrollController,
              itemCount: 15,
              itemBuilder: (BuildContext context,int index){
                return Container(
                  color: Colors.green,
                  child: Material(
                    child: ListTile(
                      title: const Text('ListTile with red background'),
                      tileColor: Colors.blue,
                    ),
                  ),
                );
              }
            )
          ),
        );
      },
    );
  }
}
