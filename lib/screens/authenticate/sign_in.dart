import 'package:brew_crew2/services/auth.dart';
import 'package:brew_crew2/shared/constants.dart';
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
  String error = '';
  final _formKey = GlobalKey<FormState>();
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
            key: _formKey,
            child: Column(children: [
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: ((value) => value!.isEmpty ? "Enter email" : null),
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
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                validator: (value) =>
                    value!.length < 6 ? 'Enter more than 6 letters' : null,
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
                  if (_formKey.currentState!.validate()) {
                    print("valid");
                    dynamic result = await _authService
                        .signWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() =>
                          error = 'could not sign in with those credantials');
                    }
                  }
                }),
                child: Text('SIGN IN'),
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.pink[200]),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red),
              )
            ]),
          )),
    );
  }
}
