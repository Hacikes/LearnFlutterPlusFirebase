import 'package:flutter/material.dart';
import 'package:learning_flutter_and_firebase/models/user.dart';
import 'package:learning_flutter_and_firebase/screen/authenticate/authenticate.dart';
import 'package:learning_flutter_and_firebase/screen/home/home.dart';
import 'package:provider/provider.dart';
import 'package:learning_flutter_and_firebase/models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // в переменную user записываем данные типа User1 и получаем их в context
    // крч получаем доступ к пользовательским данным от провайдера
    final user = Provider.of<User1?>(context);

    // Если user null идём на экран аутентификации
    // Если у user есть uid, то переходим на домашний экран
    if (user == null){
      return Authenticate();
    } else {
      return Home();
    }
  }
}
