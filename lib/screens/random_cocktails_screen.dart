import 'dart:math';
import 'package:bartender_bible/Components/drawer.dart';
import 'package:bartender_bible/Components/drawer_icon_button.dart';
import 'package:bartender_bible/Components/single_drink_list_view.dart';
import 'package:bartender_bible/Models/drink.dart';
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

  @override
  void initState() {
    //fiveDrinksList = cdbAPI.getFiveRandomDrinks();
    super.initState();
  }

  //assign to TinderCard data structure (class)
  @override
  Widget build(BuildContext context) {
    CardController controller; //Use this to trigger swap.
    double showMeOpacity = 0; //ShowMe Text opacity
    double noThanksTextOpacity = 0; //noThanks Opacity
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    return FutureBuilder(
        future: cdbAPI.getTenRandomDrinks(),
        builder: (BuildContext context, AsyncSnapshot<List<Drink>> snapshot) {
          if (snapshot.data == null) {
            return Scaffold(
              key: _scaffoldKey,
              body: Center(
                child: Container(
                  child: OrangeCircleIndicator(),
                ),
              ),
            );
          }
          return Scaffold(
            drawer: AppDrawer(),
            key: _scaffoldKey,
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DrawerIconButton(scaffoldKey: _scaffoldKey),
                      Spacer(flex: 3),
                      Image.asset('lib/images/bar-app-logo.png', scale: 6),
                      Spacer(flex: 4)
                    ],
                  ),
                  Text(
                    'Swipe on a Random Cocktail!',
                    style: kSingleDrinkCardHeading,
                  ),
                  Container(
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
                                overflow: Overflow.visible,
                                children: <Widget>[
                                  Image.network(
                                      '${snapshot.data[index].drinkThumbURL}'),
                                  Positioned(
                                      bottom: 10,
                                      left: 10,
                                      child: Text(
                                        snapshot.data[index].name,
                                        style: kSingleDrinkCardHeading.copyWith(
                                            color: Colors.white),
                                      )),
                                  ShowMeText(showMeTextOpacity: showMeOpacity),
                                  NoThanksText(
                                    noThanksTextOpacity: noThanksTextOpacity,
                                  ),
                                ],
                              ), //Image.network('${welcomeImages[index]}'),
                            ),
                        cardController: controller = CardController(),
                        swipeUpdateCallback:
                            (DragUpdateDetails details, Alignment align) {
                          /// Get swiping card's alignment
                          if (align.x < 0) {
                            //Card is LEFT swiping
                            showMeOpacity = 0.0;
                            noThanksTextOpacity = 1.0;
                          } else if (align.x > 0) {
                            //Card is RIGHT swiping
                            showMeOpacity = 1.0;
                            noThanksTextOpacity = 0;
                          } else if (align.x == 0) {
                            showMeOpacity = 0;
                            noThanksTextOpacity = 0;
                          }
                        },
                        swipeCompleteCallback:
                            (CardSwipeOrientation orientation, int index) {
                          print(orientation);
                          if (orientation == CardSwipeOrientation.RECOVER) {
                            showMeOpacity = 0;
                            noThanksTextOpacity = 0;
                          }
                          if (orientation == CardSwipeOrientation.RIGHT) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => IndividualDrinkPage(
                                        '${snapshot.data[index].drinkID}')));
                          }
                        }),
                  ),
                  SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Row(children: <Widget>[
                            Icon(Icons.arrow_back,
                                color: Colors.red[600], size: 30.0),
                            Icon(Icons.sentiment_dissatisfied,
                                color: Colors.red[600], size: 30.0),
                          ]),
                          Text(
                            "    Swipe Left to \n remove Cocktail",
                            style: kIngredientTitleStyle,
                          ),
                        ],
                      ),
                      Column(children: <Widget>[
                        Row(children: <Widget>[
                          Icon(Icons.sentiment_very_satisfied,
                              color: Colors.green[600], size: 30.0),
                          Icon(Icons.arrow_forward,
                              color: Colors.green[600], size: 30.0),
                        ]),
                        Text(
                          'Swipe Right to \n show Cocktail!',
                          style: kIngredientTitleStyle,
                        ),
                      ])
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}

class ShowMeText extends StatelessWidget {
  double showMeTextOpacity;

  ShowMeText({this.showMeTextOpacity});

  void setOpacity(double newOpacity) {
    showMeTextOpacity = newOpacity;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 5,
        left: -30,
        child: Transform.rotate(
            angle: pi / -4,
            child: Opacity(
              opacity: showMeTextOpacity,
              child: Text(
                'SHOW ME',
                style: kSingleDrinkCardHeading.copyWith(
                    color: Colors.greenAccent, fontSize: 30),
              ),
            )));
  }
}

class NoThanksText extends StatelessWidget {
  double noThanksTextOpacity;

  NoThanksText({this.noThanksTextOpacity});

  void setOpacity(double newOpacity) {
    noThanksTextOpacity = newOpacity;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 15,
        right: -30,
        child: Transform.rotate(
            angle: pi / 4,
            child: Opacity(
              opacity: noThanksTextOpacity,
              child: Text(
                'NO THANKS',
                style: kSingleDrinkCardHeading.copyWith(
                    color: Colors.red[600], fontSize: 30),
              ),
            )));
  }
}
