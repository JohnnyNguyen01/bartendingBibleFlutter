import 'package:bartender_bible/Components/favourtie_button.dart';
import 'package:bartender_bible/Util/styles.dart';
import 'package:flutter/material.dart';
import 'package:bartender_bible/screens/drink_recipe_screen.dart';

class SingleDrinkLV extends StatefulWidget {
  final ScrollController scrollController;
  final Future future;

  SingleDrinkLV({this.scrollController, this.future});

  @override
  _SingleDrinkLVState createState() => _SingleDrinkLVState();
}

class _SingleDrinkLVState extends State<SingleDrinkLV> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: widget.future,
        //snapshot returns data from the future after it resolves
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Container(
                child: OrangeCircleIndicator(),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data == null) {
            return Scaffold(
                body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.sentiment_dissatisfied,
                    color: Colors.grey,
                    size: 50.0,
                  ),
                  Text(
                    'Unfortunately, no results were found.',
                    style: kRegularTextStyle.copyWith(color: Colors.grey[600], fontSize: 15.0),
                  ),
                ],
              ),
            ));
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    contentPadding: EdgeInsets.all(10),
                    onTap: () {
                      //parse this drink id: snapshot.data[index].drinkID
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IndividualDrinkPage(
                                  snapshot.data[index].drinkID)));
                    },
                    title: Text(
                      snapshot.data[index].name,
                      style: kShowAllBtnStyle.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    leading: Image.network(
                      '${snapshot.data[index].drinkThumbURL}/preview',
                      loadingBuilder: (context, child, progress) {
                        return progress == null
                            ? child
                            : OrangeCircleIndicator();
                      },
                    ),
                    trailing: GestureDetector(
                      child: FavouriteButton(
                        drinkName: snapshot.data[index].name,
                      ),
                      onTap: () {},
                    ),
                  ),
                  Container(height: 1, width: 40, color: Colors.grey.shade300)
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class OrangeCircleIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: Colors.orange,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    );
  }
}
