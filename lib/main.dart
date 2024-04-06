import 'package:brew_dude/screens/services/auth.dart';
import 'package:brew_dude/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:brew_dude/models/Cuser.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options:FirebaseOptions(
        apiKey:'AIzaSyCw5APvD70AjFRGN92eXaoVW4tkgzMQyd8',
        appId:'id',
        messagingSenderId:'sendid',
        projectId:'brew-dude',
        storageBucket:'brew-dude.appspot.com',
      )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        title: 'Flutter Demo',
        home: Wrapper(),
      ),
    );
  }
}
