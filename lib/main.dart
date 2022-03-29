import 'package:flutter/material.dart';
import 'package:test_flutter/pages/home_page.dart';

import 'models/data_model.dart';

void main() => runApp(MyApp(post: fetchPost()));


class MyApp extends StatelessWidget {
  final Future<Post> post;
  const MyApp({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home:  const Home_page(),
    );
  }
}
