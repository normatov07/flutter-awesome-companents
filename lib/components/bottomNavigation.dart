import 'package:flutter/material.dart';

class TestBottomNavigation extends StatefulWidget {
  const TestBottomNavigation({Key? key}) : super(key: key);

  @override
  _TestBottomNavigationState createState() => _TestBottomNavigationState();
}

class _TestBottomNavigationState extends State<TestBottomNavigation> {

  int _currIndex = 0 ;

  void _onTaped(int index){
    setState(() {
        this._currIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.purple[500],
        // selectedItemColor: Colors.amber[800],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.reply_all_outlined),
              label: 'Reply',

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Account'
          ),
        ],
        currentIndex: this._currIndex,
        onTap: _onTaped,

      ),
    );
  }
}
