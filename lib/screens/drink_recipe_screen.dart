import 'package:bartender_bible/Components/favourtie_button.dart';
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
  IndividualDrink drink;

  /* for Future Builder: Future returned is type IndividualDrink */
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: cdbAPI.getByDrinkID(drinkID: widget.drinkID.toString()),
        builder:
            (BuildContext context, AsyncSnapshot<IndividualDrink> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              body: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
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
                            elevation: 10.0,
                            child: Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              height: 130.0,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[FavouriteButton(drinkName: snapshot.data.drinkName,)],
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(snapshot.data.alcoholic),
                                  Center(
                                    child: Text(
                                      '${snapshot.data.drinkName}',
                                      style: kSingleDrinkCardHeading,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(snapshot.data.category),
                                ],
                              ),
                            ),
                          ),
                        ),

                        //ListView.builder(itemBuilder: null),
                      ],
                    ),
                    SizedBox(height: 95.0),
                    Center(
                        child: Text(
                      "I N G R E D I E N T S",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 17.0),
                    )),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data.ingredients.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 8.0),
                            elevation: 8.0,
                            child: ListTile(
                              contentPadding: EdgeInsets.all(7.0),
                              leading: cdbAPI.getIngredientImage(
                                  imageName: snapshot.data.ingredients[index]),
                              title: Text(
                                snapshot.data.ingredients[index],
                                style: kIngredientTitleStyle,
                              ),
                              trailing: Column(children: <Widget>[
                                Text(
                                  "AMOUNT",
                                  style: kShowAllBtnStyle,
                                ),
                                SizedBox(height: 8),
                                Text(snapshot.data.measurements[index]),
                              ]),
                            ),
                          );
                        }),
                    SizedBox(height: 20.0),
                    Center(
                        child: Text(
                      "I N S T R U C T I O N S",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 17.0),
                    )),
                    SizedBox(height: 35.0),
                    Container(
                        height: 180.0,
                        child: Card(
                          margin: EdgeInsets.only(left: 30, right: 30),
                          elevation: 10,
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              snapshot.data.instructionsEng,
                              style: kRegularTextStyle,
                            ),
                          )),
                        )),
                    SizedBox(height: 35.0),
                  ],
                ),
              ),
            );
          }
          /*When future hasn't resolved show a circular progress indicator */
          else {
            return Scaffold(
              body: Center(
                child: Container(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.orange,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ),
            );
          }
        });
  }
}
