import 'package:brew_crew/shared/constants.dart';
import 'package:flutter/material.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  // form values
  String _currentName = '';
  String _currentSugars = '0';
  int? _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text(
            'Update your brew settings',
            style: TextStyle(fontSize: 18.0),
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration,
            validator: ((val) => val!.isEmpty ? 'Please enter a name' : null),
            onChanged: ((val) => setState(() => _currentName = val)),
          ),
          const SizedBox(height: 20.0),
          //dropdow for sugars
          DropdownButtonFormField(
            decoration: textInputDecoration,
            value: _currentSugars,
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text('$sugar sugars'),
              );
            }).toList(),
            onChanged: ((val) => setState(() => _currentSugars = val!)),
          ),
          //slider for strength
          Slider(
              activeColor: Colors.brown[_currentStrength ?? 100],
              inactiveColor: Colors.brown[_currentStrength ?? 100],
              min: 100,
              max: 900,
              divisions: 8,
              value: (_currentStrength ?? 100).toDouble(),
              onChanged: (val) =>
                  setState(() => _currentStrength = val.round())),
          ElevatedButton(
            onPressed: (() async {
              print(_currentName);
              print(_currentSugars);
              print(_currentStrength);
            }),
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.green),
            ),
            child: const Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
