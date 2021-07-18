import 'package:flutter/material.dart';
import 'package:swipeable/swipeable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late bool leftSelected;
  late bool rightSelected;

  void initState() {
    leftSelected = false;
    rightSelected = false;
    super.initState();
  }

  Widget build(BuildContext context) {
    var text = "nothing selected";
    if (leftSelected) {
      text = "left selected";
    }
    if (rightSelected) {
      text = "right selected";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Swipeable Example'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8.0),
            child: Swipeable(
              threshold: 60.0,
              onSwipeLeft: () {
                setState(() {
                  rightSelected = true;
                  leftSelected = false;
                });
              },
              onSwipeRight: () {
                setState(() {
                  rightSelected = false;
                  leftSelected = true;

                });
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    color: Colors.redAccent),
                child: ListTile(
                  title: Text(
                    text,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    color: Colors.grey[300]),
                child: ListTile(
                  leading: Container(
                    width: 12.0,
                    height: 12.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: leftSelected ? Colors.blue[500] : Colors.grey[600],
                    ),
                  ),
                  trailing: Container(
                    width: 12.0,
                    height: 12.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: rightSelected
                          ? Colors.lightGreen[500]
                          : Colors.grey[600],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
