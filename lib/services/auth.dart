import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // в _auth _ означает, что мы можем использовать эту переменную только внутри этого файла
  // _auth даст нам доступ к FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

//----------------------------------------------------------------------------------------------
  // sign in anon
  Future signInAnon() async {
    try {
      // Пытаемся войти анонимно в приложение с помощью метода signInAnonymously
      // Записываем резуьтат аутентификации типа UserCredential
      UserCredential result = await _auth.signInAnonymously();
      // User - пользователький объект
      User? user = result.user;
      // Возвращаем объект user с данными аутентификации
      return user;
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
  //sing out



}