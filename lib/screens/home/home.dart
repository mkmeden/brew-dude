import 'package:brew_dude/screens/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_dude/screens/services/database.dart';
import 'package:brew_dude/screens/home/settings_form.dart';
import 'package:brew_dude/screens/home/brewlist.dart';
import 'package:brew_dude/models/brew.dart';
import 'package:brew_dude/models/Cuser.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    
    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context) {

        return Container(
          padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 80),
          child: SettingsForm(),
        );
      });
    }
    // final UserData? prepopValues = Provider.of<UserData?>(context);
    //
    // print('$prepopValues is the anseer');
    return StreamProvider<List<Brew>?>.value(
      initialData: null,
      value: DatabaseService(uid:null).brews,
      child: Scaffold(
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
            )) ,

            TextButton.icon(
                onPressed: _showSettingsPanel ,
                icon: Icon(
                    Icons.settings,
                  color: Colors.black,

                ),
                label: Text(
                    'Settings',
                  style: TextStyle(
                    color: Colors.black
                  ),
                ))
          ],
        ),

        body: BrewList(),

      ),
    );
  }
}
