import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:swipeable/swipeable.dart';

class ChatDetailScreen extends StatefulWidget {
  _ChatDetailScreen createState() => _ChatDetailScreen();
}

class _ChatDetailScreen extends State<ChatDetailScreen> {
  final dummyMessages = List<String>.generate(1000, (i) => 'Message $i');
  late bool leftSelected;
  late bool rightSelected;
  final Color scaffoldBgColor = const Color(0xfff0eee4);

  @override
  void initState() {
    leftSelected = false;
    rightSelected = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://picsum.photos/id/237/200/300'),
              ),
            ),
          ],
        ),
        title: Material(
          color: Colors.white.withOpacity(0.0),
          child: InkWell(
            onTap: () {},
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Text(
                        'Flutter Fumes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.videocam),
                onPressed: () {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Video Call Button tapped')));
                },
              );
            },
          ),
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.call),
                onPressed: () {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Call Button tapped')));
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: ListView.builder(
                itemCount: dummyMessages.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Swipeable(
                      threshold: 100.0,
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
                      child: Card(
                        key: UniqueKey(),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(dummyMessages[index]),
                        ),
                      ),
                      background: Icon(
                        Icons.reply,
                        color: Colors.black26,
                      ),
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Column(
              children: [
                leftSelected
                    ? _replyWidget()
                    : AnimatedContainer(
                        duration: Duration(seconds:1),
                      ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(const Radius.circular(30.0)),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              padding: const EdgeInsets.all(0.0),
                              disabledColor: Colors.grey,
                              color: Colors.redAccent,
                              icon: Icon(Icons.insert_emoticon),
                              onPressed: () {},
                            ),
                            Flexible(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.all(0.0),
                                  hintText: 'Type a message',
                                  hintStyle: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                  counterText: '',
                                ),
                                onSubmitted: (String text) {},
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                maxLength: 100,
                              ),
                            ),
                            IconButton(
                              color: Colors.redAccent,
                              icon: Icon(Icons.attach_file),
                              onPressed: () {},
                            ),
                            IconButton(
                              color: Colors.redAccent,
                              icon: Icon(Icons.camera_alt),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: FloatingActionButton(
                          elevation: 2.0,
                          foregroundColor: Colors.white,
                          child: Icon(Icons.send),
                          onPressed: () {
                            Fluttertoast.showToast(msg: 'Sending Message');
                          }),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _replyWidget() {
    return AnimatedContainer(
      alignment: Alignment.centerLeft,
      duration: Duration(seconds: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(12),
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
                  Text('This is text message sample',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                      )),
                ],
              ),
            ),
            Positioned(
                right: 10,
                top: 10,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      leftSelected = false;
                      rightSelected = false;
                    });
                  },
                  child: Icon(
                    Icons.clear,
                    color: Colors.black87,
                    size: 18,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
