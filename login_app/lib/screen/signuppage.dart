import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_app/services/usermanagement.dart';

import 'loading.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email;
  String _password;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingScreen()
        : Scaffold(
            appBar: AppBar(
              title: Text("Sign up"),
              backgroundColor: Colors.red,
            ),
            body: Center(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(hintText: 'Email'),
                      onChanged: (value) {
                        setState(() {
                          _email = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'Password'),
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      child: Text('SignUp'),
                      color: Colors.red,
                      textColor: Colors.white,
                      elevation: 7.0,
                      onPressed: () {
                        setState(() {
                          loading = true;
                        });
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: _email,
                          password: _password,
                        )
                            .then((signedInUser) {
                          UserManagement()
                              .storeNewUser(signedInUser.user, context);
                        }).catchError((e) {
                          print(e);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
