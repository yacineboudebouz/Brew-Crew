import 'package:brew_crew2/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function? toggleView;
  Register({this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _authService = AuthService();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Register to Brew Crew'),
        actions: [
          IconButton(
              onPressed: () {
                widget.toggleView!();
              },
              icon: Icon(Icons.person_add))
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            child: Column(children: [
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                onChanged: (value) => {
                  setState(
                    () => email = value,
                  )
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                obscureText: true,
                onChanged: (value) => {
                  setState(
                    () => {password = value},
                  )
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: (() async {
                  print(email);
                  print(password);
                }),
                child: Text('REGISTER'),
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.pink[200]),
              )
            ]),
          )),
    );
  }
}
