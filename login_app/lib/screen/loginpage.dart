import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'loading.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingScreen()
        : Scaffold(
            appBar: AppBar(
              title: Text("Log In"),
              backgroundColor: Colors.red,
            ),
            body: Center(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Email',
                      ),
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
                      obscureText: true,
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
                      child: Text('Login'),
                      color: Colors.red,
                      textColor: Colors.white,
                      elevation: 7.0,
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _email, password: _password)
                            .then((value) {
                          Navigator.of(context).pushReplacementNamed('/home');
                        }).catchError((e) {
                          print(e);
                        });
                      },
                    ),
                    Text('Dont have an account'),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      child: Text('SignUp'),
                      color: Colors.red,
                      textColor: Colors.white,
                      elevation: 7.0,
                      onPressed: () {
                        Navigator.of(context).pushNamed('/signup');
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
