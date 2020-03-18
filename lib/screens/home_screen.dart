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
                      padding: EdgeInsets.only(left: 10),
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
            SizedBox(height: 50),
            //Container(color: Colors.red, child: Text('HELP')),

            Container(
              height: 180,
              width: 380,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 13,
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            //alignment: Alignment.topCenter,
                            image: AssetImage(
                                'lib/images/Spencer-Davis-unsplash.jpg'),
                          ),
                        ),
                      ),
                    )),
                    Container(
                        height: 35,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('TITLE'),
                            Text('SHOW ALL'),
                          ],
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
