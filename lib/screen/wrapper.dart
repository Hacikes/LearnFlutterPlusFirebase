import 'package:flutter/material.dart';
import 'package:learning_flutter_and_firebase/screen/authenticate/authenticate.dart';
import 'package:learning_flutter_and_firebase/screen/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Вернуть или экран home или authenticate
    return Authenticate();
  }
}
