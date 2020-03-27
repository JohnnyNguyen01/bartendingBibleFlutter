import 'package:bartender_bible/Models/individual_drink.dart';
import 'package:bartender_bible/Services/cocktaildb_api.dart';
import 'package:bartender_bible/Util/styles.dart';
import 'package:flutter/material.dart';

class IndividualDrinkPage extends StatefulWidget {
  final String drinkID;
  IndividualDrinkPage(this.drinkID);
  @override
  _IndividualDrinkPageState createState() => _IndividualDrinkPageState();
}

class _IndividualDrinkPageState extends State<IndividualDrinkPage> {
  CocktailDbAPI cdbAPI = CocktailDbAPI();
  var drink;

  //Assigns the future drink object to drink, used in initState
  void getDrink() async {
    drink = await cdbAPI.getByDrinkID(drinkID: widget.drinkID.toString());
  }

  @override
  void initState() {
    super.initState();
    getDrink();
  }

  /* for Future Builder: Future returned is type IndividualDrink */
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: cdbAPI.getByDrinkID(drinkID: widget.drinkID.toString()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
                body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(
                      height: 270,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(snapshot.data.thumbURL),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 80,
                      right: 80, 
                      bottom: -70,
                      child: Card(
                        elevation: 5.0,
                        child: Container(
                          height: 130.0,
                          child: Center(
                            child: Text(
                              '${snapshot.data.drinkName}',
                              style: kCardHeading,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //ListView.builder(itemBuilder: null),
                  ],
                )
              ],
            ));
          }
          /*When future hasn't resolved show a circular progress indicator */
          else {
            return Center(
              child: Container(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.orange,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            );
          }
        });
  }
}
