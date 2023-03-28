import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning_flutter_and_firebase/models/user.dart';

class AuthService {
  // в _auth _ означает, что мы можем использовать эту переменную только внутри этого файла
  // _auth даст нам доступ к FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Функция создания пользовательского объекта на основе Firebase
  // тип определён классом User1
  User1? _userFromFirebaseUser(User? user){
    // Возвращаем проверку, что пользователь не равен null и тогда возвращаем uid
    // пользователя используя класс User, а параметр uid будет определяться
    // параметром user этой функции
    return user != null ? User1(uid: user.uid) : null;
  }

//----------------------------------------------------------------------------------------------

  // Поток авторизации пользователей
  Stream<User1?> get user {
    return _auth.authStateChanges()
        .map((user) => _userFromFirebaseUser(user));
  }

  // sign in anon
  Future signInAnon() async {
    try {
      // Пытаемся войти анонимно в приложение с помощью метода signInAnonymously
      // Записываем результат аутентификации типа UserCredential
      UserCredential result = await _auth.signInAnonymously();
      // User - пользовательский объект
      User? user = result.user;
      // Возвращаем объект _userFromFirebaseUser с данными аутентификации
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//----------------------------------------------------------------------------------------------
// sign in with email/password



//----------------------------------------------------------------------------------------------
// register with email/password



//----------------------------------------------------------------------------------------------
// sign out



}