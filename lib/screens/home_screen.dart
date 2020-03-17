import 'package:flutter/material.dart';

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
                Positioned(
                  bottom: -35,
                  left: 50,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    child: Container(
                      padding: EdgeInsets.only(left:10),
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.search),
                            border: InputBorder.none,
                            hintText: 'Find Cocktail'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
