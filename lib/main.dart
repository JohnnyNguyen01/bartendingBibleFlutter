import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/classic_cocktails_screen.dart';
import 'screens/cocktails_by_alcohol.dart';
import 'screens/cocktails_by_vodka.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    //method below disables landscape screen orientation
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.orange),
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/ClassicCocktails': (context) => ClassicsScreen(),
        '/CocktailsByAlcohol': (context) => CocktailsByAlcohol(),
        '/VodkaCocktails': (context) => VodkaSelectionScreen(),
      },
    );
  }
}
