import 'package:brew_crew2/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
   Home({super.key});
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              icon: Icon(Icons.person_remove))
        ],
      ),
    );
  }
}
