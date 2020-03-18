import 'package:flutter/material.dart';
import 'package:bartender_bible/Components/home_page_button.dart';
import 'package:bartender_bible/Components/rounded_search_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            AssetImage('lib/images/brooke-lark-unsplash.png')),
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
                          image: AssetImage('lib/images/bar-app-logo.png')),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 85,
                  child: Container(
                      color: Colors.black,
                      child: Text(
                        'Cocktails at your fingertips',
                        style: TextStyle(color: Colors.white, fontSize: 20),
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
                          AssetImage('lib/images/Spencer-Davis-unsplash.jpg')),
                  SizedBox(height: 15),
                  HomePageButton(
                      title: 'Classic Cocktails',
                      image:
                          AssetImage('lib/images/hessam-hojati-unsplash.jpg')),
                  SizedBox(height: 15),
                  HomePageButton(
                      title: 'Cocktails By Alcohol',
                      image:
                          AssetImage('lib/images/john-cafazza-unsplash.jpg')),
                  SizedBox(height: 15),
                  HomePageButton(
                      title: 'All Cocktails',
                      image:
                          AssetImage('lib/images/johann-trasch-unsplash.jpg')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
