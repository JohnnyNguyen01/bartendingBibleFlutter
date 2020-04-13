import 'package:bartender_bible/Components/drawer.dart';
import 'package:bartender_bible/Components/drawer_icon_button.dart';
import 'package:bartender_bible/Components/single_drink_list_view.dart';
import 'package:bartender_bible/Models/individual_drink.dart';
import 'package:bartender_bible/Services/cocktaildb_api.dart';
import 'package:bartender_bible/Util/styles.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bartender_bible/screens/drink_recipe_screen.dart';

class MostPopularScreen extends StatefulWidget {
  @override
  _MostPopularScreenState createState() => _MostPopularScreenState();
}

class _MostPopularScreenState extends State<MostPopularScreen> {
  CocktailDbAPI cdbAPI = CocktailDbAPI();
  List<IndividualDrink> drinkList;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Center(
              child: Row(
                children: <Widget>[
                  DrawerIconButton(scaffoldKey: _scaffoldKey),
                  TypewriterAnimatedTextKit(
                    text: ['Most Popular Cocktails'],
                    textStyle: kSingleDrinkCardHeading,
                    speed: Duration(milliseconds: 300),
                    totalRepeatCount: 1,
                  ),
                ],
              ),
            ),
            Divider(height: 20),
            FutureBuilder(
                future: cdbAPI.getMostPopular(),
                builder: (BuildContext buildContext,
                    AsyncSnapshot<List<IndividualDrink>> snapshot) {
                  if (snapshot.data == null) {
                    return Align(
                      alignment: Alignment.center,
                      child: OrangeCircleIndicator(),
                    );
                  }
                  return Expanded(
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return Stack(children: <Widget>[
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Stack(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      snapshot.data[index].thumbURL,
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 12.0,
                                      left: 5.0,
                                      child: Text(
                                        snapshot.data[index].drinkName,
                                        style: kIngredientTitleStyle.copyWith(
                                          color: Colors.white,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Positioned.fill(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                IndividualDrinkPage(snapshot
                                                    .data[index].drinkID)));
                                  },
                                ),
                              ),
                            )
                          ]);
                        }),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
