class User1 {

  final String uid; // uid - уникальный идентификатор пользователя

  // Конструктор
  User1({required this.uid}){}
}

class UserData {
  final String? uid;
  final String? name;
  final String? sugars;
  final int? strength;

  UserData({ required this.uid, required this.sugars, required this.strength, required this.name });
}