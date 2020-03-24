import 'package:flutter/material.dart';
import 'package:bartender_bible/Util/styles.dart';
import 'package:bartender_bible/Services/cocktaildb_api.dart';
import 'package:bartender_bible/Models/drink.dart';

class VodkaSelectionScreen extends StatefulWidget {
  @override
  _VodkaSelectionScreenState createState() => _VodkaSelectionScreenState();
}

class _VodkaSelectionScreenState extends State<VodkaSelectionScreen> {
  List<Drink> drinkList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //makeMap();
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
          SizedBox(height: 15.0),
          FlatButton(
              color: Colors.blue,
              onPressed: ()  {
                makeMap();
              },
              child: Text('press me'))
        ],
      ),
    );
  }

  void makeMap() async {
    CocktailDbAPI cdb = CocktailDbAPI();
    var response = await cdb.getByAlcoholType(alcoholType: "Vodka");
    var result = response['drinks'] as List;
    for(var jsonObject in result){
      drinkList.add(Drink(jsonObject));
      print(jsonObject['strDrink']);
    }
    print(drinkList);
    //print(result[0]['strDink']);
  }
}
