import 'package:bartender_bible/Components/drawer.dart';
import 'package:bartender_bible/Components/drawer_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:bartender_bible/Util/styles.dart';
import 'package:bartender_bible/Services/cocktaildb_api.dart';
import 'package:bartender_bible/Components/single_drink_list_view.dart';

class TequilaSelectionScreen extends StatefulWidget {
  @override
  _TequilaSelectionScreenState createState() => _TequilaSelectionScreenState();
}

class _TequilaSelectionScreenState extends State<TequilaSelectionScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    CocktailDbAPI cdbAPI = CocktailDbAPI();
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      body: Column(
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                width: 500,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        'lib/images/kevin-kelly-tequila-unsplash.jpg'),
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
                        'Tequila Selection',
                        style: kCardHeading,
                      ),
                    ),
                  ),
                ),
              ),
              SafeArea(child: DrawerIconButton(scaffoldKey: _scaffoldKey, iconColor: Colors.black),),
            ],
          ),
          SizedBox(height: 28.0),
          SingleDrinkLV(
            future: cdbAPI.getByAlcoholType(alcoholType: 'Tequila'),
          ),
        ],
      ),
    );
  }

  //Get search result, turn into list, convert all object from json List into Objects of drink in drinkLIST

}
