import 'package:flutter/material.dart';

import 'package:test_flutter/pages/home_page.dart';
void main() => runApp(const MyApp());
//final main so far
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home:  const HomePage(),
    );
  }
}