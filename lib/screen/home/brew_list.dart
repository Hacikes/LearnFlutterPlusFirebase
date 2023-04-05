import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:learning_flutter_and_firebase/models/brew.dart';

class BrewList extends StatefulWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {

    // Получаем снимок
    final brews = Provider.of<List<Brew?>?>(context);
    //print(brews.docs);
    // Делаем проверку на null, так как без этого СОВСЕМ БЛИН НЕ РАБОТАЕТ
    // когда вызываем эту штуку на экране home АААААААААААААААААААААААААА
    if(brews!=null){
      brews.forEach((brew) {
        print(brew?.name);
        print(brew?.sugars);
        print(brew?.strength);
      });
    }
    return Container();
  }
}

//