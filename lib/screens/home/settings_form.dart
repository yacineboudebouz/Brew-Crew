import 'package:brew_crew2/models/user.dart';
import 'package:brew_crew2/services/database.dart';
import 'package:brew_crew2/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew2/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  // form values
  String? _currentName;
  String? _currentSugars;
  int? _currentStrength = 100;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot != null) {
          UserData? userData = snapshot.data;
          return Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    'Update your brew settings',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Name',
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        )),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a name' : null,
                    onChanged: (value) => setState(() => _currentName = value  ),
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField(
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                        value: sugar,
                        child: Text('$sugar sugars'),
                      );
                    }).toList(),
                    onChanged: (sugar) => setState(
                        () => _currentSugars = sugar ?? userData!.sugars),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Strength',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Slider(
                    activeColor: Colors.brown[_currentStrength!],
                    inactiveColor: Colors.brown[_currentStrength!],
                    min: 100,
                    max: 900,
                    divisions: 8,
                    onChanged: (value) => setState(
                      () => _currentStrength = value.round(),
                    ),
                    value: (_currentStrength!.toDouble()),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await DatabaseService(uid: user.uid).updateUserData(
                            _currentSugars!,
                            _currentName!,
                            _currentStrength!,
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Update'))
                ],
              ));
        } else {
          return Loading();
        }
      },
    );
  }
}
