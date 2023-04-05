import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learning_flutter_and_firebase/models/brew.dart';


class DatabaseService {

  final String? uid;
  // консруктор для передачи uid
  DatabaseService({ this.uid});

  // Ссылка на колекцию в бд для получения и изменения данных
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brew');

  // Функция с тремя параметрами: сахар, имя и крепость
  // асинхронно возвращаем колекцию с данными
  Future updateUserData(String sugar, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sugar': sugar,
      'name': name,
      'strength': strength,
    });
  }

  // Делаем список из Snapshot(снимка)
  List<Brew>? _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return Brew(
        name: data['name'] ?? '',
        strength: data['strength'] ?? 0,
        sugars: data['sugars'] ?? '',
      );
    }).toList();
  }

  // Получение потока данных brew
  Stream<List<Brew>?>? get brews {
    // Возвращаем снимок коллекции данных из бд
    return brewCollection.snapshots()
      .map(_brewListFromSnapshot);
  }



}
