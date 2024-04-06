import 'package:brew_dude/screens/authenticate/signin.dart';
import 'package:flutter/material.dart';
import 'package:brew_dude/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool isSignin = true;

  void toggleView(){
    setState(() {
      isSignin = !isSignin;

    });
  }

  @override
  Widget build(BuildContext context) {

    if(isSignin == false)
    return Container(
      child: Register(toggleView : toggleView),
    );

    else
      return Container(
        child: SignIn(toggleView : toggleView),
      );
  }
}
