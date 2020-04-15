import 'package:bartender_bible/Components/drawer.dart';
import 'package:bartender_bible/Components/single_drink_list_view.dart';
import 'package:bartender_bible/Services/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:bartender_bible/Components/drawer_icon_button.dart';
import 'package:bartender_bible/Util/styles.dart';

class FavouritesScreen extends StatefulWidget {
  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  ImageProvider heroImage = AssetImage('lib/images/kelly-sikkema-unsplash.jpg');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      body: Column(children: <Widget>[
        Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              width: 500,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: heroImage,
                ),
              ),
            ),
            Positioned(
              left: 80,
              right: 80,
              bottom: -23,
              child: Card(
                elevation: 5.0,
                child: Container(
                  height: 40,
                  child: Center(
                    child: Text(
                      'Favourites',
                      style: kCardHeading,
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
                child: DrawerIconButton(
              scaffoldKey: _scaffoldKey,
              iconColor: Colors.orange,
            )),
          ],
        ),
        SingleDrinkLV(scrollController: _scrollController, future: DBProvider.db.getAllDrinks(),),
      ]),
    );
  }
}
