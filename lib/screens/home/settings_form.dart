import 'package:flutter/material.dart';
import 'package:brew_crew2/shared/constants.dart';

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
  int? _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Text(
          'Update your brew settings',
          style: TextStyle(fontSize: 18.0),
        ),
        SizedBox(
          height: 20.0,
        ),
        TextFormField(
          decoration: textInputDecoration.copyWith(
              hintText: 'Name',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2.0),
              )),
          validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
          onChanged: (value) => setState(() => _currentName = value),
        ),
        SizedBox(height: 20),
        DropdownButtonFormField(
          items: sugars.map((sugar) {
            return DropdownMenuItem(
              value: sugar ?? '0',
              child: Text('$sugar sugars'),
            );
          }).toList(),
          onChanged: (sugar) => setState(() => _currentSugars = sugar),
        )
      ],
    ));
  }
}
