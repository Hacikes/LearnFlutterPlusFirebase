import 'package:flutter/material.dart';
import 'package:learning_flutter_and_firebase/models/brew.dart';

class BrewTitle extends StatelessWidget {

  // Переменная типа напитка
  final Brew? brew;
  BrewTitle({this.brew});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        // Виджет плитки
        child: ListTile(
          // Аватарка слева
          leading: CircleAvatar(
            radius: 25.0,
            // фон зависит от крепости
            backgroundColor: Colors.brown[brew?.strength ?? 100],
          ),
          title: Text(brew?.name ?? ''),
          subtitle: Text('Takes ${brew?.sugars ?? ''} sugar(s)'),
        ),
      ),
    );
  }
}
