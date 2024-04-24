import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_dude/screens/services/database.dart';
import 'package:provider/provider.dart';
import 'package:brew_dude/screens/home/brewtile.dart';
import 'package:brew_dude/models/brew.dart';

class BrewList extends StatefulWidget {
  const BrewList({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {

  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>?>(context);

    // print(brews.docs);

    // print('hi');
    // for (var val in brews.docs) {
    // print((val.data() as Map)['sugars']);
    // }
    // print('bye');



    return ListView.builder(
      itemCount: brews==null ? 0 : brews.length,
        itemBuilder: (context , index) {
        return BrewTile(brew : brews?[index]);
        }
    );
  }
}
