import 'package:brew_crew2/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew2/models/brew.dart';

class BrewTile extends StatelessWidget {
  Brew? brew;
  BrewTile({this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[brew!.strength],
          ),
          title: Text(brew!.name),
          subtitle: Text('Takes ${brew!.sugars} sugar(s)'),
        ),
      ),
    );
  }
}
