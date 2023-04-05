import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {

    // Получаем снимок
    final brews = Provider.of<QuerySnapshot>(context);
    //print(brews.docs);
    // Делаем проверку на null, так как без этого СОВСЕМ БЛИН НЕ РАБОТАЕТ
    // когда вызываем эту штуку на экране home АААААААААААААААААААААААААА
    if(brews!=null){
      // Циклически просматриваем наши коллекции
      for(var doc in brews.docs) {
        // распечатываем данные из каждой коллекции
        print(doc.data());
      }
    }
    return Container();
  }
}

//