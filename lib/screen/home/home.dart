import 'package:flutter/material.dart';
import 'package:learning_flutter_and_firebase/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:learning_flutter_and_firebase/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learning_flutter_and_firebase/screen/home/brew_list.dart';
import 'package:learning_flutter_and_firebase/models/brew.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  // Сделали экзмемпляр класса AuthService
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    // Теперь эта штука будет передавать, то что находится в коллекции
    return StreamProvider<List<Brew?>?>.value(
      initialData: null,
      value: DatabaseService(uid: '').brews,

      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            ElevatedButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: BrewList(),
      ),
    );

  }
}

//