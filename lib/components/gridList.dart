import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class TestGridList extends StatefulWidget {
  const TestGridList({Key? key}) : super(key: key);

  @override
  _TestGridListState createState() => _TestGridListState();
}

class _TestGridListState extends State<TestGridList> {
  int a = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: List.generate(20, (index) {
          // a =  index % 8;
          // if(a==0)a+=1;
          return Card(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                SizedBox(
                  child: Stack(
                    children: [
                      Positioned(
                        child: Image.asset(
                          'assets/burger2.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          bottom: 5,
                          left: 5,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Salom',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(color: Colors.white),
                            ),
                          ))
                    ],
                  ),
                  // height: 180,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: ()=>{}, child: Text('Open')),
                    TextButton(onPressed: () => {}, child: Text('Add set'))
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
