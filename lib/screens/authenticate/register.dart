import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:brew_dude/screens/services/auth.dart';
import '../../models/Cuser.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth  = AuthService();
  String email = '', password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register to Brew Dude'),
        backgroundColor: Colors.brown[300],
        elevation: 0.0,
        actions: <Widget>[
          Icon(Icons.person),
          TextButton(onPressed: (){
              widget.toggleView();
          } ,
            child: Text('Signin',
              style: TextStyle(
                color: Colors.grey[800]
              ),

            ),

          )
        ],
      ),

      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                TextFormField(
                  onChanged: (val){
                    setState(() {
                      email = val;
                    });
                  },
                ),

                SizedBox(height: 20,),
                TextFormField(
                  obscureText: true,
                  onChanged: (val) {
                    password = val ;
                  },
                ),
                SizedBox(height: 20,),

                TextButton(
                  onPressed: (){

                    print(email);
                    print(password);
                  },

                  style: TextButton.styleFrom(
                      backgroundColor: Colors.pink
                  ),
                  child: Text('Register',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
