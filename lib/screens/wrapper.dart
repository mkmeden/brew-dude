import 'package:brew_dude/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:brew_dude/screens/home/home.dart';
import 'package:brew_dude/screens/authenticate/authenticate.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Authenticate();
  }
}
