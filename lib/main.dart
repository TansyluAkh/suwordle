import 'package:flutter/material.dart';

import 'game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: Spelling(items: {'ашказаны': 'https://urban.tatar/bebkeler/tatar/keshe/ashkazany.m4a', 'бавыр': 'https://urban.tatar/bebkeler/tatar/keshe/bavyr.m4a', 'бөер': 'https://urban.tatar/bebkeler/tatar/keshe/boer.m4a', 'йөрәк': 'https://urban.tatar/bebkeler/tatar/keshe/jorak.m4a'}, tatcategory: 'бу',),
    );
  }
}
