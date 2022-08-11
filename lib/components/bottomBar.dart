import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  // const BottomBar({Key? key, IconTheme child}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  // FloatingActionButtonLocation _fabLocation = FloatingActionButtonLocation.centerTop;

  // FloatingActionButtonLocation _fabLocation = FloatingActionButtonLocation.centerDocked;
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: IconTheme(
          data: IconThemeData(color: Theme
              .of(context)
              .colorScheme
              .onPrimary),
          child: Row(
            children: <Widget>[
              IconButton(
                tooltip: 'Open navigation menu',
                icon: const Icon(Icons.adjust_rounded),
                onPressed: () {},
              ),
              // if (centerLocations.contains(fabLocation)) const Spacer(),
              IconButton(
                icon: Icon(Icons.adb_rounded),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Favorite',
                icon: const Icon(Icons.favorite),
                onPressed: () {},
              ),
            ],
          ),
        ),
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {}, child: Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
