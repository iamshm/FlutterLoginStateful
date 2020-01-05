import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseUser currentUser;
  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  void _loadCurrentUser() {
    FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
      setState(() {
        // call setState to rebuild the view
        this.currentUser = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(currentUser.email),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Logged In'),
                SizedBox(height: 20),
                OutlineButton(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    style: BorderStyle.solid,
                    width: 3.0,
                  ),
                  child: Text('Log out'),
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      Navigator.of(context).pushReplacementNamed('/landing');
                    }).catchError((e) {
                      print(e);
                    });
                  },
                )
              ],
            ),
          ),
        ));
  }
}
