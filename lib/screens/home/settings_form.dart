import 'package:brew_dude/loading.dart';
import 'package:brew_dude/screens/services/database.dart';
import 'package:flutter/material.dart';
import 'package:brew_dude/constants.dart';
import 'package:provider/provider.dart';
import 'package:brew_dude/models/Cuser.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0' ,'1' , '2' , '3', '4'];

  String? currentName , currentSugar ;
  int? currentStrength;
  @override
  Widget build(BuildContext context) {

    final CUser? user = Provider.of<CUser?>(context);
            return StreamBuilder<UserData?>(
              stream: DatabaseService(uid : user?.uid).userData,
              builder: (context, snapshot) {


                if(snapshot.hasData)
                  {

                    UserData? userData = snapshot.data ;

                    return Form(
                        key: formKey,
                        child: Column(
                          children: <Widget>[
                            Text('Update Brew' ,
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              initialValue: userData?.name,
                              validator: (val){
                                return val!.isEmpty? 'Please enter a Name' : null ;
                              },
                              decoration: textInputDecoration,
                              onChanged: (val){
                                setState(() {
                                  currentName = val;
                                });
                              },
                            ),
                            SizedBox(height: 30,),
                            DropdownButtonFormField(
                                decoration: textInputDecoration,
                                value: currentSugar??userData?.sugars,
                                items: sugars.map((sugar) {
                                  return DropdownMenuItem(
                                      value: sugar,
                                      child:Text('$sugar sugars')
                                  );
                                } ).toList(),
                                onChanged: (val){

                                  setState(() {
                                    currentSugar =val ;

                                  });
                                }),

                            SizedBox(height: 30,),

                            Slider(value: (currentStrength??userData?.strength)!.toDouble(),
                                min: 100,
                                max: 900,
                                activeColor: Colors.brown[(currentStrength??100)],
                                inactiveColor: Colors.brown[(currentStrength??100)],
                                divisions: 8,
                                onChanged:(val){
                                  setState(() {
                                    currentStrength = val.round();
                                  });
                                }

                            ),
                            ElevatedButton(onPressed: () async{

                              if(formKey.currentState!.validate())
                                {

                                  await DatabaseService(uid : user?.uid).updateUserData(
                                      currentSugar ?? userData!.sugars! ,
                                      currentName?? userData!.name!,
                                      currentStrength?? userData!.strength!
                                  );
                                  Navigator.pop(context);
                                }
                            },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.pink
                                ),
                                child:Text('Update', style: TextStyle(color: Colors.white),)
                            )
                          ],
                        )
                    );
                  }

                else
                  {
                    return Loading();
                  }

              }
            );

  }
}
