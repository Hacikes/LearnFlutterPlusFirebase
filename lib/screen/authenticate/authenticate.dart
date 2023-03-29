import 'package:flutter/material.dart';
import 'package:learning_flutter_and_firebase/screen/authenticate/register.dart';
import 'package:learning_flutter_and_firebase/screen/authenticate/sign_in.dart';
import 'package:learning_flutter_and_firebase/screen/authenticate/authenticate.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Вызываем виджет Register для аутентификации
      child: Register(),
    );
  }
}
