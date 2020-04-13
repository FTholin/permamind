import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  final User user;

  ContactUsScreen({
    Key key,
    @required this.user,
  })
      : assert(user != null),
        super(key: key);

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contact Us !'),
          actions: <Widget>[
            IconButton(
              onPressed: null,
              icon: Icon(Icons.send),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Recipient',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Subject',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: null,
                    maxLines: 10,
                    decoration: InputDecoration(
                        labelText: 'Body', border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.send),
          label: Text('Send Message'),
          onPressed: null,
        ),
      ),
    );
  }

}