import 'package:brew_crew2/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';

import 'home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    // return home or authnticate
    return Authnticate();
  }
}