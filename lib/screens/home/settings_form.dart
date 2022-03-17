import 'package:flutter/material.dart';
import 'package:asad_crew/util/constants.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  //Key associated to this form instance
  final _formKey = GlobalKey<FormState>();
  //Amount of sugars the person wants in their tea/coffee
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  //Form value
  String? _currentName = null;
  String? _currentSugars = null;
  int? _currentStrength = null;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Update crew settings',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) => val!.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() {
              _currentName = val;
            }),
          ),
          SizedBox(height: 20.0),
          //dropdown menu
          DropdownButtonFormField<String>(
            value: _currentSugars ?? '0',
            //List of drop down menu item widgets - map through sugars
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text("$sugar sugars"),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _currentSugars = value!;
              });
            },
          ),
          //slider here
          Slider(
            value: (_currentStrength ?? 100).toDouble(),
            activeColor: Colors.grey[_currentStrength ?? 500],
            inactiveColor: Colors.grey[_currentStrength ?? 500],
            min: 100,
            max: 900,
            divisions: 8,
            onChanged: (val) => setState(() => _currentStrength = val.round()),
          ),
          //button to submit
          ElevatedButton(
              onPressed: () async {
                print(_currentName);
                print(_currentStrength);
                print(_currentSugars);
              },
              style: ElevatedButton.styleFrom(primary: Colors.pink[400]),
              child: Text(
                'Update',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
