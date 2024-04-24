import 'package:brew_dude/models/Cuser.dart';
import 'package:brew_dude/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:brew_dude/screens/services/database.dart';
import 'package:brew_dude/screens/home/home.dart';
import 'package:brew_dude/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {

    final CUser? user = Provider.of<CUser?>(context);
    print(user);
    if(user==null)
    return Authenticate();

    else
      return StreamProvider<UserData?>.value(

          value: DatabaseService(uid : user.uid).userData,
          initialData: null,
          child: Home()
      );
  }
}
