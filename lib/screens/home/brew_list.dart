import 'package:brew_crew2/models/brew.dart';
import 'package:brew_crew2/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew2/services/database.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';

class BrewList extends StatefulWidget {
  const BrewList({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>?>(context);
    if (brews != null)
      brews.forEach((brew) {
        print(brew.name);
        print(brew.sugars);
        print(brew.strength);
      });
    return Container();
  }
}
