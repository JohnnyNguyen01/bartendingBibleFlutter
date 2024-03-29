import 'package:bartender_bible/screens/all_drinks_screen.dart';
import 'package:bartender_bible/screens/cocktails_brandy_screen.dart';
import 'package:bartender_bible/screens/cocktails_by_gin_screen.dart';
import 'package:bartender_bible/screens/cocktails_rum.dart';
import 'package:bartender_bible/screens/cocktails_tequila_screen.dart';
import 'package:bartender_bible/screens/cocktails_whisky_screen.dart';
import 'package:bartender_bible/screens/favourites_screen.dart';
import 'screens/most_popular_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/random_cocktails_screen.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.orange),
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/RandomCocktails': (context) => RandomCocktailScreen(),
        '/CocktailsByAlcohol': (context) => CocktailsByAlcohol(),
        '/VodkaCocktails': (context) => VodkaSelectionScreen(),
        '/GinCocktails': (context) => GinSelectionScreen(),
        '/TequilaCocktails': (context) => TequilaSelectionScreen(),
        '/RumCocktails': (context) => RumSelectionScreen(),
        '/WhiskyCocktails': (context) => WhiskySelectionScreen(),
        '/BrandyCocktails': (context) => BrandySelectionScreen(),
        '/MostPopular': (context) => MostPopularScreen(),
        '/AllDrinks': (context) => AllDrinksScreen(),
        '/Favourites': (context) => FavouritesScreen(),
      },
    );
  }
}
