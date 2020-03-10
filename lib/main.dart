import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  DatabaseReference _databaseReference;
  String firebase_taken = "";
  Map<String, dynamic> notify;
  String title;
  String body;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fcm.getToken().then((firebase_token) {
      firebase_taken = "${firebase_token}";
      print("ddssdx  ${firebase_token}");
    });
    _fcm.subscribeToTopic("alaa");
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage : ${message}');
        setState(() {
          title = message['notification']['title'];
          body = message['notification']['body'];
        });
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: ListTile(
                    title: Text(
                      message['notification']['title'],
                      textAlign: TextAlign.end,
                    ),
                    subtitle: Text(message['notification']['body'],
                        textAlign: TextAlign.end),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Ok'),
                      onPressed: () {
                        print('Tappped');
                        _databaseReference = FirebaseDatabase.instance.reference().child('Notification');
                        _databaseReference.set(
                            {
                              'title' : title,
                              'body' : body
                            }
                        );
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ));
      },

      onResume: (Map<String, dynamic> message) async {
        print('onMessage : ${message}');
        setState(() {
          title = message['notification']['title'];
          body = message['notification']['body'];
        });
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: ListTile(
                    title: Text(
                      message['notification']['title'],
                      textAlign: TextAlign.end,
                    ),
                    subtitle: Text(message['notification']['body'],
                        textAlign: TextAlign.end),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Ok'),
                      onPressed: () {
                        print('Tappped');
                        _databaseReference = FirebaseDatabase.instance.reference().child('Notification');
                        _databaseReference.set(
                            {
                              'title' : title,
                              'body' : body
                            }
                        );
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ));
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('onMessage : ${message}');
       setState(() {
         title = message['notification']['title'];
         body = message['notification']['body'];
       });

        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: ListTile(
                    title: Text(
                      message['notification']['title'],
                      textAlign: TextAlign.end,
                    ),
                    subtitle: Text(message['notification']['body'],
                        textAlign: TextAlign.end),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Ok'),
                      onPressed: () {
                        print('Tappped');
                        _databaseReference = FirebaseDatabase.instance.reference().child('Notification');
                        _databaseReference.set(
                            {
                              'title' : title,
                              'body' : body
                            }
                        );
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ));
      },
    );



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Text("Notification"),
      ),
    );
  }
}
