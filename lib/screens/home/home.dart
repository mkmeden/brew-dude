import 'package:brew_dude/screens/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {


  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Brew Dude'),
        elevation: 0,
        backgroundColor: Colors.brown[400],
        actions: <Widget>[
          Icon(Icons.person),
          TextButton(onPressed: () async{
              await _auth.Signout();
          }, child: Text('Logout',
              style: TextStyle(
                color: Colors.black
              ),
          ))
        ],
      ),

    );
  }
}
