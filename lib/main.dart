import 'package:flutter/material.dart';
import 'package:shopping_screen/home.dart';

void main()
{
  runApp( const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  const HomeScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor:const Color(0xFFF9F9F9),
      ),
    );
  }
}