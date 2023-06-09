import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:learning_flutter_and_firebase/screen/wrapper.dart';
import 'package:learning_flutter_and_firebase/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:learning_flutter_and_firebase/models/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // С помощью StreamProvider можем прослушивать потоки
    return StreamProvider<User1?>.value(
      // Указываем какой поток мы хотим прослушать и какие данные получить обратно
      // в данном случае поток AuthService и оборачивает приложение MaterialApp
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

