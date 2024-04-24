import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:brew_dude/screens/services/auth.dart';
import '../../loading.dart';
import '../../models/Cuser.dart';
import 'package:brew_dude/constants.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  String email = '', password = '', error = '';
  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return isLoading? Loading() : Scaffold(
      appBar: AppBar(
        title: Text('Sign in to Brew Dude'),
        backgroundColor: Colors.brown[300],
        elevation: 0.0,
        actions: <Widget>[
          Icon(Icons.person),
          TextButton(
            onPressed: () {
              widget.toggleView();
            },
            child: Text(
              'Register',
              style: TextStyle(color: Colors.grey[800]),
            ),
          )
        ],
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),

                  validator: (val) => val!.length < 6
                      ? 'Enter a password with characters greater than 6'
                      : null,
                  obscureText: true,
                  onChanged: (val) {
                    password = val;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () async {

                    setState(() {
                      isLoading = true ;
                    });
                    if (_formkey.currentState?.validate() != null) {
                      dynamic result = await _auth.signInwithEmailandPassword(
                          email, password);

                      if (result == null) {
                        setState(() {
                          error = 'Cannot sign in with these credentials';
                          isLoading = false;
                        });
                      }
                    }
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.pink),
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
