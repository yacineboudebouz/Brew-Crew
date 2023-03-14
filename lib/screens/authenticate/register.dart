import 'package:brew_crew2/services/auth.dart';
import 'package:brew_crew2/shared/constants.dart';
import 'package:flutter/material.dart';

import '../../shared/loading.dart';

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
  String error = "";
  bool loading = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
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
                  key: _formKey,
                  child: Column(children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Email'),
                      validator: ((value) =>
                          value!.isEmpty ? 'Enter an email' : null),
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
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Password'),
                      obscureText: true,
                      validator: ((value) => value!.length < 6
                          ? 'Enter more than 6 letters'
                          : null),
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
                          setState(() => loading = true);
                          dynamic result = await _authService
                              .registerWithEmailAndPassword(email, password);
                          if (result == null) {
                            loading = false;
                            setState(
                                () => error = 'please supply a valid email');
                          }
                        }
                      }),
                      child: Text('REGISTER'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink[200]),
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
