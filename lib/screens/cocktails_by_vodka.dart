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
    makeMap();
  }

  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: SingleDrinkLV(
              scrollController: _scrollController,
              drinkList: drinkList,
            ),
          ),
        ],
      ),
    );
  }

  //Get search result, turn into list, convert all object from json List into Objects of drink in drinkLIST
  void makeMap() async {
    CocktailDbAPI cdb = CocktailDbAPI();
    var response = await cdb.getByAlcoholType(alcoholType: "Vodka");
    var result = response['drinks'] as List;
    for (var jsonObject in result) {
      drinkList.add(Drink(jsonObject));
    }
    print('length is ${drinkList.length}');
  }
}
