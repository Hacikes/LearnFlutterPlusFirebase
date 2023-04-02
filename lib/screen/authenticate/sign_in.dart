import 'package:flutter/material.dart';
import 'package:learning_flutter_and_firebase/services/auth.dart';

class SignIn extends StatefulWidget {

  // Передаём свойсто toggleView для того, чтобы понимать какой экран перключать
  // крч добавляем его в конструктор экземпляра класса
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  // Создаём экзмепляр класса AuthService
  final AuthService _auth = AuthService();

  // Переменные для состояние логина и пароля
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to app'),
        //
        actions: <Widget>[
          ElevatedButton.icon(
            icon: Icon(Icons.person),
              label: Text('Register'),
              onPressed: () {
              // использем функцию для переключения вида
                widget.toggleView();
              },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              // Тут указываем, что произойдёт, когда поле формы изменится
              TextFormField(
                // Каждый раз, когда значение в форме меняется
                // будет запускаться эта функция
                // крч форма логина
                onChanged: (val) {
                  // Устанавливаем состояние для логина
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0,),
              // Форма логина
              TextFormField(
                // заменяет ввод на точки, как во всех вводах пароля
                obscureText: true,
                onChanged: (val){
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                  onPressed: () async {
                    print(email);
                    print(password);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[400]
                  ),
                  child: Text(
                      'Sign In',
                      style: TextStyle(color:Colors.white),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
