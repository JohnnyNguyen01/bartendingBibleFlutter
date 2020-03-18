import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/classic_cocktails_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.orange),
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/ClassicCocktails': (context) => ClassicsScreen(),
      },
    );
  }
}
