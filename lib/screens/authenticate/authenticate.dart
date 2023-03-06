import 'package:brew_crew2/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authnticate extends StatefulWidget {
  const Authnticate({super.key});

  @override
  State<Authnticate> createState() => _AuthnticateState();
}

class _AuthnticateState extends State<Authnticate> {
  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}