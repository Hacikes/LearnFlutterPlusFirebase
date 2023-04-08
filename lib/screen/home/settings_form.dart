import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learning_flutter_and_firebase/models/user.dart';
import 'package:learning_flutter_and_firebase/services/database.dart';
import 'package:learning_flutter_and_firebase/shared/constant.dart';
import 'package:learning_flutter_and_firebase/shared/loading.dart';
import 'package:provider/provider.dart';

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
  late int? _currentStrength = 100 ;

  @override
  Widget build(BuildContext context) {

    // в переменную user записываем данные типа User1 и получаем их в context
    // крч получаем доступ к пользовательским данным от провайдера
    final user = Provider.of<User1?>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user?.uid).userData,
      builder: (context, snapshot) {
        // Если есть данные в снимке, то выполняем нашу вереницу виджетов
        // иначе возвращаем экран загрузки
        if(snapshot.hasData){
          UserData? userData = snapshot.data;
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
                  // Дефотный хинт на поле name
                  initialValue: userData?.name,
                  decoration: textInputDecoration,
                  validator: (val) => val!.isEmpty ? 'Please enter a name' : null,
                  onChanged: (val) => setState(() => _currentName = val),
                ),
                SizedBox(height: 20.0),
                // Выпадающий список
                DropdownButtonFormField(
                  // value - значение, которое мы выбрали - текущее содержание сахара
                  value: _currentSugars ?? userData?.sugars,
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
                  activeColor: Colors.brown[_currentStrength ?? userData?.strength ?? 100],
                  inactiveColor: Colors.brown[_currentStrength ?? userData?.strength ?? 100],
                  min: 100.0,
                  max: 900.0,
                  value: (_currentStrength ?? userData?.strength)!.toDouble(),
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
                      // Проверяем вадидность данных и после
                      // методом updateUserData обновляем информацию
                      if(_formKey.currentState!.validate()){
                        await DatabaseService(uid: user?.uid).updateUserData(
                            _currentSugars ?? userData!.sugars!,
                            _currentName ?? userData!.name!,
                            _currentStrength ?? userData!.strength!
                        );
                        Navigator.pop(context);
                      }
                    }
                ),
              ],
            ),
          );
        } else {
          return Loading();
        }
      }
    );
  }
}
