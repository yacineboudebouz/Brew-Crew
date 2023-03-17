import 'package:brew_crew2/models/brew.dart';
import 'package:brew_crew2/screens/home/settings_form.dart';
import 'package:brew_crew2/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_crew2/services/database.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import 'brew_list.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: ((context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.2, horizontal: 60.0),
              child: SettingsForm(),
            );
          }));
    }

    return StreamProvider<List<Brew>?>.value(
      catchError: (_, __) => null,
      value: DatabaseService().brews,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: [
            IconButton(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person_remove)),
            IconButton(
                onPressed: () => _showSettingsPanel(),
                icon: Icon(Icons.settings))
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
