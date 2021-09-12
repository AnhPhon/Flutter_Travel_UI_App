import 'package:flutter/material.dart';
import 'package:fluttertravelui/screens/Home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Travel UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF3ebace),
        accentColor: Color(0xFFd8ecf1),
        scaffoldBackgroundColor: Color(0xFFf3f5f7),
      ),
      home: HomeScreen(),
    );
  }
}
