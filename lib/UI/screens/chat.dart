import 'package:flutter/material.dart';
import 'package:medic_pulse_doc/Helper/Style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
User loggedInUser;

String patientUID = "oTO2zQN5oWUtYqjl0CnzyGioXfM2";

class Chat extends StatefulWidget {
  final name;
  Chat({this.name});
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  void messageStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var msg in snapshot.docs) {
        print(msg.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                width: MediaQuery.of(context).size.width * 0.80,
                decoration: BoxDecoration(
                  color: Color(0xFFAEDFFF),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(100),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: 32,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 6,
                      child: Text(
                        widget.name,
                        style: dialogHead.copyWith(fontSize: 20),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.call,
                        size: 24,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.video_call,
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Icon(
                      Icons.more_vert,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
          MessageStream(),
          //-----------------------------------------------------------------------------------------------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: TextField(
                    controller: messageTextController,
                    onChanged: (value) {
                      messageText = value;
                    },
                    decoration: kMessageTextFieldDecoration,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.attach_file_sharp,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.camera_alt_rounded,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: FlatButton(
                      onPressed: () {
                        messageTextController.clear();
                        // _firestore.collection('messages').doc(now.toString()).set(
                        //     {'text': messageText, 'sender': loggedInUser.email});
                        _firestore
                            .collection('userInfo')
                            .doc(patientUID)
                            .collection('conversation')
                            .doc(loggedInUser.uid)
                            .collection('chat')
                            .add({
                          'content': messageText,
                          'sender': loggedInUser.uid,
                          'timestamp': Timestamp.now(),
                          'type': 0
                        });
                      },
                      child: Icon(
                        Icons.send,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //------------------------------------------------------------------------------------------------------
        ],
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('userInfo')
          .doc(patientUID)
          .collection('conversation')
          .doc(loggedInUser.uid)
          .collection('chat')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messages = snapshot.data.docs;
          List<MessageBubble> messageBubbles = [];
          for (var msg in messages) {
            final messageText = msg.data()['content'];
            final attachment = msg.data()['attachment'];
            final messageSender = msg.data()['sender'];
            final curusr = loggedInUser.uid;

            final messageBubble = MessageBubble(
              text: messageText,
              sender: messageSender,
              isMe: messageSender == curusr,
              attach: attachment,
            );
            messageBubbles.add(messageBubble);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: messageBubbles,
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blueGrey,
            ),
          );
        }
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.text, this.isMe, this.attach});
  final String sender;
  final String text;
  final String attach;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            elevation: 12.0,
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0))
                : BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
            color: isMe ? Colors.green.shade400 : Colors.blueGrey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 22.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    attach != null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(attach),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    Container(
                      child: Text(
                        '$text',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
