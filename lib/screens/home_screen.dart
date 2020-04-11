import 'package:flutter/material.dart';
import 'package:bartender_bible/Components/home_page_button.dart';
import 'package:bartender_bible/Components/rounded_search_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AssetImage heroImage;
  AssetImage classicsImage;
  AssetImage byAlcoholImage;
  AssetImage favouritesImage;
  AssetImage allDrinksImage;
  AssetImage logo;

  @override
  void initState() {
    super.initState();
    heroImage = AssetImage('lib/images/brooke-lark-unsplash.png');
    classicsImage = AssetImage('lib/images/brooke-lark-unsplash.png');
    favouritesImage = AssetImage('lib/images/Spencer-Davis-unsplash.jpg');
    byAlcoholImage = AssetImage('lib/images/john-cafazza-unsplash.jpg');
    allDrinksImage = AssetImage('lib/images/johann-trasch-unsplash.jpg');
    logo = AssetImage('lib/images/bar-app-logo.png');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(heroImage, context);
    precacheImage(classicsImage, context);
    precacheImage(favouritesImage, context);
    precacheImage(byAlcoholImage, context);
    precacheImage(allDrinksImage, context);
    precacheImage(logo, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                //image container - background image
                Container(
                  width: 500,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(fit: BoxFit.cover, image: heroImage),
                  ),
                ),
                // Logo widget
                Positioned(
                  bottom: 60,
                  left: 130,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: logo),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 85,
                  child: Container(
                      padding: EdgeInsets.all(5),
                      color: Colors.black,
                      child: Text(
                        'Cocktails at your fingertips',
                        style: GoogleFonts.lato(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      )),
                ),
                //Search bar card
                RoundedSearchBar(),
              ],
            ),
            SizedBox(height: 39),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(left: 8, right: 8),
                children: <Widget>[
                  HomePageButton(
                      title: 'Favourites',
                      image:
                          favouritesImage),
                  SizedBox(height: 15),
                  HomePageButton(
                    title: 'Random Cocktails',
                    image: classicsImage,
                    onTapFunction: () {
                      Navigator.pushNamed(context, '/RandomCocktails');
                    },
                  ),
                  SizedBox(height: 15),
                  HomePageButton(
                    title: 'Cocktails By Alcohol',
                    image: byAlcoholImage,
                    onTapFunction: () {
                      Navigator.pushNamed(context, '/CocktailsByAlcohol');
                    },
                  ),
                  SizedBox(height: 15),
                  HomePageButton(
                    title: 'All Cocktails',
                    image: allDrinksImage,
                    onTapFunction: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
