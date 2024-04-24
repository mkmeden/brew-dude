import 'package:flutter/material.dart';

class BrewTile extends StatelessWidget {


  final brew ;
  BrewTile({required this.brew});

  print(brew) {
    // TODO: implement print
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Card(
              margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.brown[brew.strength],
                ),
                title: Text(brew.name),
                subtitle: Text('${brew.sugars}'),

                  ),
            ),

    );
  }
}
