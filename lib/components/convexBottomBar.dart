import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';


class TestConvexBottomBar extends StatefulWidget {
  const TestConvexBottomBar({Key? key}) : super(key: key);

  @override
  _TestConvexBottomBarState createState() => _TestConvexBottomBarState();
}

class _TestConvexBottomBarState extends State<TestConvexBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home,title: 'home'),
          TabItem(icon: Icons.map,title: 'map'),
          TabItem(icon: Icons.add,title: 'add'),
          TabItem(icon: Icons.message,title: 'message'),
          TabItem(icon: Icons.people,title: 'people'),
        ],
        initialActiveIndex: 2,
        onTap: (int i)=>print('click $i'),
      ),
    );
  }
}
