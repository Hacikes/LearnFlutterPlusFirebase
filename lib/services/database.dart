import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService {

  // Ссылка на колекцию в бд для получения и изменения данных
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brew');


}