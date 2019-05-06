import 'package:flutter/material.dart';

class AppBarBottom extends StatefulWidget {
 final List<BottomNavigationBarItem> bottomBarItems = [];

 AppBarBottom() {
    bottomBarItems.add (
      BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          title: Text(
            "Explore",
            style: TextStyle(color: Colors.black),
          )),
    );
    bottomBarItems.add(
      BottomNavigationBarItem(
        icon: Icon(
          Icons.list,
        ),
        title: Text("Whish List")
      )
    );
    bottomBarItems.add(
        BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
            ),
            title: Text("Notification")
        )
    );
    bottomBarItems.add(
        BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
            ),
            title: Text("Profile")
        )
    );
  }

  _AppBarBottomState createState() => _AppBarBottomState();
}

class _AppBarBottomState extends State<AppBarBottom> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      items: widget.bottomBarItems,
      type: BottomNavigationBarType.fixed,
    );
  }
}
