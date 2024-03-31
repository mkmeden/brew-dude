import 'package:flutter/material.dart';
import 'package:brew_dude/screens/services/auth.dart';
class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth  = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brew Dude'),
        backgroundColor: Colors.brown[100],
        elevation: 0.0,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: ElevatedButton(
          child: Text('Sign in'),
          onPressed: (){
            dynamic result  = _auth.signInAnon();

            if(result==null)
              {
                print('Signing in failed');
              }

            else
              {
                print('Signed in');
                print(result);
              }
          },
        ),
      ),
    );
  }
}
