import 'package:bartender_bible/Components/drawer.dart';
import 'package:bartender_bible/Services/cocktaildb_api.dart';
import 'package:bartender_bible/Util/styles.dart';
import 'package:flutter/material.dart';
import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'package:bartender_bible/Models/drink.dart';

class AllDrinksScreen extends StatefulWidget {
  @override
  _AllDrinksScreenState createState() => _AllDrinksScreenState();
}

class _AllDrinksScreenState extends State<AllDrinksScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  CocktailDbAPI cdbAPI = CocktailDbAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: AppDrawer(),
        body: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: SafeArea(
                  child: Text(
                'All Drinks',
                style: kSingleDrinkCardHeading.copyWith(fontSize: 30.0),
              )),
            ),
            FutureBuilder(future: cdbAPI.getAllDrinks(),builder: (BuildContext context, AsyncSnapshot<List<Drink>> snapshot){
              return null;
            })
            //AlphabetListScrollView(strList: null, indexedHeight: null)
          ],
        ));
  }

}
