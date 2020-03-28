import 'package:bartender_bible/Models/individual_drink.dart';
import 'package:bartender_bible/Services/cocktaildb_api.dart';
import 'package:bartender_bible/Util/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IndividualDrinkPage extends StatefulWidget {
  final String drinkID;
  IndividualDrinkPage(this.drinkID);
  @override
  _IndividualDrinkPageState createState() => _IndividualDrinkPageState();
}

class _IndividualDrinkPageState extends State<IndividualDrinkPage> {
  CocktailDbAPI cdbAPI = CocktailDbAPI();
  IndividualDrink drink;

  //Assigns the future drink object to drink, used in initState
  void getDrink() async {
    drink = await cdbAPI.getByDrinkID(drinkID: widget.drinkID.toString());
    print(drink.ingredients.length);
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
            return Scaffold(body: LayoutBuilder(
              builder:
                  (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                    child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConstraints.maxHeight),
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
                                child: Center(
                                  child: Text(
                                    '${snapshot.data.drinkName}',
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w700)),
                                  ),
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
                      Container(
                        //TODO make height dynamic not fixed!
                        height: 900,
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data.ingredients.length,
                            itemBuilder: (context, index) {
                              return Card(
                                  child: ListTile(
                                title: Text(snapshot.data.ingredients[index]),
                                trailing: Column(children: <Widget>[
                                  Text('AMOUNT'),Text(snapshot.data.measurements[index])
                                ]),
                              ));
                            }),
                      ),
                    ],
                  ),
                ));
              },
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
