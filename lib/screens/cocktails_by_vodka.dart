import 'package:flutter/material.dart';
import 'package:bartender_bible/Util/styles.dart';
import 'package:bartender_bible/Services/cocktaildb_api.dart';
import 'package:bartender_bible/Models/drink.dart';
import 'package:bartender_bible/Components/single_drink_list_view.dart';

class VodkaSelectionScreen extends StatefulWidget {
  @override
  _VodkaSelectionScreenState createState() => _VodkaSelectionScreenState();
}

class _VodkaSelectionScreenState extends State<VodkaSelectionScreen> {
  ScrollController _scrollController = ScrollController();
  List<Drink> drinkList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CocktailDbAPI cdbAPI = CocktailDbAPI();
    return Scaffold(
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
                    image:
                        AssetImage('lib/images/alec-favale-vodka-unsplash.jpg'),
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
                        'Vodka Selection',
                        style: kCardHeading,
                      ),
                    ),
                  ),
                ),
              ),
              //ListView.builder(itemBuilder: null),
            ],
          ),
          SizedBox(height: 28.0),
          //TODO : fix list loading issue
          SingleDrinkLV(
            future: cdbAPI.getByAlcoholType(alcoholType: 'Vodka'),
          ),
        ],
      ),
    );
  }

  //Get search result, turn into list, convert all object from json List into Objects of drink in drinkLIST

}
