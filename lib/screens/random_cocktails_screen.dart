import 'package:bartender_bible/Components/single_drink_list_view.dart';
import 'package:bartender_bible/Models/individual_drink.dart';
import 'package:bartender_bible/screens/drink_recipe_screen.dart';
import 'package:flutter/material.dart';
import 'package:bartender_bible/Util/styles.dart';
import 'package:bartender_bible/Services/cocktaildb_api.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class RandomCocktailScreen extends StatefulWidget {
  @override
  _RandomCocktailScreenState createState() => _RandomCocktailScreenState();
}

class _RandomCocktailScreenState extends State<RandomCocktailScreen> {
  CocktailDbAPI cdbAPI = CocktailDbAPI();
  // create list of drinks
  Future<List<IndividualDrink>> fiveDrinksList;

  @override
  void initState() {
    fiveDrinksList = cdbAPI.getFiveRandomDrinks();
    super.initState();
  }

  //assign to TinderCard data structure (class)
  @override
  Widget build(BuildContext context) {
    CardController controller; //Use this to trigger swap.

    return FutureBuilder(
        future: fiveDrinksList,
        builder: (BuildContext context,
            AsyncSnapshot<List<IndividualDrink>> snapshot) {
          if (snapshot.data == null) {
            return Scaffold(
              body: Center(
                child: Container(
                  child: OrangeCircleIndicator(),
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: TinderSwapCard(
                    orientation: AmassOrientation.BOTTOM,
                    totalNum: snapshot.data.length,
                    stackNum: 3,
                    swipeEdge: 4.0,
                    maxWidth: MediaQuery.of(context).size.width * 0.9,
                    maxHeight: MediaQuery.of(context).size.width * 0.9,
                    minWidth: MediaQuery.of(context).size.width * 0.8,
                    minHeight: MediaQuery.of(context).size.width * 0.8,
                    cardBuilder: (context, index) => Card(
                          child: Stack(
                            children: <Widget>[
                              Image.network('${snapshot.data[index].thumbURL}'),
                              Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Text(
                                    snapshot.data[index].drinkName,
                                    style: kSingleDrinkCardHeading.copyWith(
                                        color: Colors.white),
                                  )),
                            ],
                          ), //Image.network('${welcomeImages[index]}'),
                        ),
                    cardController: controller = CardController(),
                    swipeUpdateCallback:
                        (DragUpdateDetails details, Alignment align) {
                      /// Get swiping card's alignment
                      if (align.x < 0) {
                        //Card is LEFT swiping
                      } else if (align.x > 0) {
                        //Card is RIGHT swiping
                      }
                    },
                    swipeCompleteCallback:
                        (CardSwipeOrientation orientation, int index) {
                      print(orientation);
                      if (orientation == CardSwipeOrientation.LEFT) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => IndividualDrinkPage(
                                    '${snapshot.data[index].drinkID}')));
                      }

                      /// Get orientation & index of swiped card!
                    }),
              ),
            ),
          );
        });
  }
}
