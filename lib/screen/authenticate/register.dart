import 'package:flutter/material.dart';
import 'package:learning_flutter_and_firebase/screen/authenticate/sign_in.dart';
import 'package:learning_flutter_and_firebase/services/auth.dart';
import 'package:learning_flutter_and_firebase/shared/constant.dart';

class Register extends StatefulWidget {

  // Передаём свойсто toggleView для того, чтобы понимать какой экран перключать
  // крч добавляем его в конструктор экземпляра класса
  final Function toggleView;
  Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

// Создаём экзмепляр класса AuthService
// Будем использовать в будующем
final AuthService _auth = AuthService();
// Валидация логина и пароля
final _formKey = GlobalKey<FormState>();

// Переменные для состояние логина и пароля
String email = '';
String password = '';
String error = '';

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Register in to app'),
        actions: <Widget>[
          ElevatedButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          // поможет остележить форму и её состояние
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              // Тут указываем, что произойдёт, когда поле формы изменится
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                // Валидация того, я вляется ли поле пустым
                // возвращаем сообщение если поле пустое, иначе возвращаем null
                validator: (val) => val!.isEmpty ? 'Enter an email': null,
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
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                // Валидация того, я вляется ли поле пустым
                // возвращаем сообщение если поле пустое, иначе возвращаем null
                validator: (val) => val!.length < 6 ? 'Enter an password 6 + char long': null,
                // заменяет ввод на точки, как во всех вводах пароля
                obscureText: true,
                onChanged: (val){
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic result = await _auth .registerWithEmailAndPassword(email, password);
                    if (result == null){
                      setState(() => error = 'Please supply a valid email');
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[400]
                ),
                child: Text(
                  'Register',
                  style: TextStyle(color:Colors.white),
                ),
              ),
              SizedBox(height: 12.0,),
              // Печатаем текст ошибки, что email пустой
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
