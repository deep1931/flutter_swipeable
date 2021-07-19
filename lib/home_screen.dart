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

                  _replyWidget();
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
                  child: Positioned(
                    bottom: 10,
                    child: _replyWidget(),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _replyWidget() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border(
                  left: BorderSide(color: Colors.purple, width: 3),
                ),
              ),
              child: Column(
                children: [
                  Text('Reply',
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 15,
                          fontWeight: FontWeight.w500)),
                  SizedBox(height: 3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
