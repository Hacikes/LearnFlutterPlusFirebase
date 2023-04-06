import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learning_flutter_and_firebase/shared/constant.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  // Ключ для использование в форме
  final _formKey = GlobalKey<FormState>();
  // Значения количества сахара в кофе
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  // Значения для формы
  late String _currentName;
  // Инициализируем сахар сразу, иначе выпадающий список ругается
  String _currentSugars = '0';
  int _currentStrength = 100;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Column(
          children: <Widget>[
            Text(
              'Update your brew settings.',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: textInputDecoration,
              validator: (val) => val!.isEmpty ? 'Please enter a name' : null,
              onChanged: (val) => setState(() => _currentName = val),
            ),
            SizedBox(height: 20.0),
            // Выпадающий список
            DropdownButtonFormField(
              // value - значение, которое мы выбрали - текущее содержание сахара
              value: _currentSugars ?? '0',
              decoration: textInputDecoration,
              // Благодаря map список будет возвращаться итеративно,
              // как в цикле for
              items: sugars.map((sugar) {
                return DropdownMenuItem(
                  value: sugar,
                  child: Text('$sugar sugars'),
                );
              }).toList(),
              onChanged: (val) => setState(() => _currentSugars = val! ),
            ),
            // Слайдер
            Slider(
                activeColor: Colors.brown[_currentStrength ?? 100],
                inactiveColor: Colors.brown[_currentStrength ?? 100],
                min: 100.0,
                max: 900.0,
                value: (_currentStrength ?? 100).toDouble(),
                divisions: 8,
                // round нужно просто для округления
                onChanged: (val) => setState(() => _currentStrength = val.round()),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[400],
                ),
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  print(_currentName);
                  print(_currentSugars);
                  print(_currentStrength);
                }
            ),
          ],
        ),
    );
  }
}
