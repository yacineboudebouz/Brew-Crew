import 'package:brew_crew2/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function? toggleView;
  SignIn({this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
        title: Text('Sign in to Brew Crew'),
        actions: [
          IconButton(
              onPressed: () {
                widget.toggleView!();
              },
              icon: Icon(Icons.person))
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
                child: Text('SIGN IN'),
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.pink[200]),
              )
            ]),
          )),
    );
  }
}
