import 'package:brew_crew2/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_crew2/services/database.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<QuerySnapshot?>(context);

    // for (var doc in brews.docs) {
    //   print(doc);
    // }
    return Container();
  }
}
