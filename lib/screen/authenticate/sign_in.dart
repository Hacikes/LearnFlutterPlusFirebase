import 'package:flutter/material.dart';
import 'package:learning_flutter_and_firebase/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  // Создаём экзмепляр класса AuthService
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to app'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: ElevatedButton(
          child: Text('Sign in anon'),
          onPressed: () async {
            // Вызываем метод анонимной аутентификации
            // И записываем это в динамическую переменную
            dynamic result = await _auth.signInAnon();
            if (result == null){
                print('Error singing in');
              } else {
                print('Sign in');
                // Тут вызываем result.uid и получаем uid в консоле
                print(result.uid);
              }
            },
        ),
      ),
    );
  }
}
