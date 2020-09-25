import 'package:flutter/material.dart';
import 'nodo_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NodoPage(),
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        primarySwatch: Colors.cyan,
      ),
    );
  }
}
