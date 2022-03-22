import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sabanciwordle/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const c = Color(0xff044b93);
    return MaterialApp(
      title: 'SUword',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Montserrat',
      ),
      home: LoginPage()
    );
  }
}
