import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bartender_bible/Components/drawer.dart';
import 'package:bartender_bible/Components/drawer_icon_button.dart';
import 'package:bartender_bible/Components/single_drink_list_view.dart';
import 'package:bartender_bible/Services/cocktaildb_api.dart';
import 'package:bartender_bible/Util/styles.dart';
import 'package:bartender_bible/screens/drink_recipe_screen.dart';
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
  List<String> namesList = [];
  Future<List<Drink>> drinkList;

  void getNameDrinkList() async {
    drinkList = cdbAPI.getAllDrinks();
    List<Drink> tempList = await drinkList;
    tempList.forEach((drink) => namesList.add(drink.name));
  }

  @override
  void initState() {
    getNameDrinkList();
    super.initState();
  }

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
                  child: Row(
                children: <Widget>[
                  DrawerIconButton(
                      scaffoldKey: _scaffoldKey, iconColor: Colors.black),
                  TypewriterAnimatedTextKit(
                    text: ['All Drinks'],
                    speed: Duration(milliseconds: 700),
                    textStyle: kSingleDrinkCardHeading.copyWith(fontSize: 30.0),
                    totalRepeatCount: 1,
                  ),
                ],
              )),
            ),
            SizedBox(height: 25.0),
            FutureBuilder(
                future: drinkList,
                builder: (BuildContext context,
                    AsyncSnapshot<List<Drink>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.data != null) {
                    return Expanded(
                      child: AlphabetListScrollView(
                        strList: namesList,
                        indexedHeight: (index) {
                          return 60.0;
                        },
                        showPreview: true,
                        keyboardUsage: true,
                        itemBuilder: (context, index) => ListTile(
                          leading: Image.network(
                            snapshot.data[index].drinkThumbURL,
                            loadingBuilder: (context, child, progress) {
                              return progress == null
                                  ? child
                                  : OrangeCircleIndicator();
                            },
                          ),
                          title: Text(snapshot.data[index].name, style: kIngredientTitleStyle,),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => IndividualDrinkPage(
                                      snapshot.data[index].drinkID.toString()))),
                        ),
                      ),
                    );
                  } else {
                    return Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: (MediaQuery.of(context).size.height / 2.8),
                          ),
                          Text(
                            'Too many drinks, please give me a few seconds 😰😰	',
                            style: kRegularTextStyle.copyWith(fontSize: 14.0),
                          ),
                          SizedBox(height: 15.0),
                          OrangeCircleIndicator(),
                        ],
                      ),
                    );
                  }
                })
            //AlphabetListScrollView(strList: null, indexedHeight: null)
          ],
        ));
  }
}
