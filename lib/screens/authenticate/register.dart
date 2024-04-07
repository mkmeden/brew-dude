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
  String email = '', password = '' , error = '';
  final _formkey = GlobalKey<FormState>();
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
            key: _formkey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                TextFormField(
                  validator: (val) => val!.isEmpty?'Enter an email' : null,
                  onChanged: (val){
                    setState(() {
                      email = val;
                    });
                  },
                ),

                SizedBox(height: 20,),
                TextFormField(
                  validator: (val)=> val!.length <6 ? 'Enter a password with characters greater than 6': null,
                  obscureText: true,
                  onChanged: (val) {
                    password = val ;
                  },
                ),
                SizedBox(height: 20,),

                TextButton(
                  onPressed: () async{

                    if(_formkey.currentState?.validate()!=null)
                      {
                        dynamic result = await _auth.registerWithEmailandPassword(email, password);
                        if(result==null)
                          {
                            setState(() {
                              error = 'Please supply a valid email';
                            });
                          }

                      }

                  },

                  style: TextButton.styleFrom(
                      backgroundColor: Colors.pink
                  ),
                  child: Text('Register',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),

                SizedBox(height : 20),
                Text(error ,
                style: TextStyle(
                  color: Colors.red,
                ),
                )
              ],
            ),
          )
      ),
    );
  }
}
