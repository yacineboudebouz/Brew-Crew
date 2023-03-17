import 'package:brew_crew2/models/brew.dart';
import 'package:brew_crew2/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew2/services/database.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import 'brew_tile.dart';

class BrewList extends StatefulWidget {
  const BrewList({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>?>(context);

    return ListView.builder(
      itemCount: brews!.length,
      itemBuilder: (context, index) {
        return BrewTile(brew: brews[index]);
      },
    );
  }
}
