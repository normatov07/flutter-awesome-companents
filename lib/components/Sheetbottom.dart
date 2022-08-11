import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestBootmSheet extends StatefulWidget {
  const TestBootmSheet({Key? key}) : super(key: key);

  @override
  _TestBootmSheetState createState() => _TestBootmSheetState();
}

class _TestBootmSheetState extends State<TestBootmSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text('Open'),
        onPressed: () => {
          showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top:Radius.circular(25))),
            builder: (BuildContext context) { return Container(
              height: 200,

              child: Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child:IconButton(icon: Icon(Icons.museum_rounded),onPressed:()=>{})
              ),

            );}
          )
        },
      ),
    );
  }
}
